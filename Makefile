PGK=gitlab-support
VER=$$(/bin/ls ${PGK} \
	| sort --human-numeric-sort --reverse \
	| head -1)
TMP=RM.md
FIN=README.md

# Test locally, by running RSpec and
# copying latest yml to local package install
inject:
	cp  ${PGK}/${VER}/*.rb \
		${PGK}/${VER}/package.yml \
		"$$(espanso path packages)/${PGK}/"
	espanso restart

# Reinstall from public master
reset:
	espanso uninstall ${PGK}
	espanso install ${PGK} --external  \
		https://github.com/katrinleinweber/espanso-${PGK}
	espanso restart

# Convert YML to Markdown table & append to README
tabulate:
	rg --no-line-number --before-context=99 '# List of included espansions' ${FIN} > ${TMP}
	echo '\nTrigger | Espansion' >> ${TMP}
	echo '------- | ---------' >> ${TMP}
	yq eval '.matches' -o=json \
		gitlab-support/**/package.yml \
	| jq -r '.[] | [.trigger, .replace]' \
	| jq -r '@tsv' \
	| awk '{print "``` "$$0}' \
	| awk '{print $$0" ```"}' \
	| perl -p -e 's/\|/\\|/g' \
	| perl -p -e 's/\t/ ``` | ``` /g' \
	| perl -p -e 's/ ``` ```/ ` ```/g' \
	| perl -p -e 's/``` ```/``` `/g' \
	>> ${TMP}
	mv -f ${TMP} ${FIN}
	git add ${FIN}
