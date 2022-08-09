PGK=gitlab-support
EPP="$$(espanso path packages)/${PGK}/"
TMP=RM.md
FIN=README.md

# Test locally, by running RSpec and
# copying latest yml to local package install
inject:
	mkdir -p ${EPP} || true
	cp  ${PGK}/*.rb \
		${PGK}/package.yml \
		${EPP}
	espanso restart

# Reinstall from public master
reset:
	espanso install ${PGK} --external --force --git \
		https://gitlab.com/gitlab-com/support/toolbox/espanso
	espanso restart

# Convert YML to Markdown table & append to README
tabulate:
	rg --no-line-number --before-context=99 '# List of included espansions' ${FIN} > ${TMP}
	echo '\nTrigger | Espansion' >> ${TMP}
	echo '------- | ---------' >> ${TMP}
	yq eval '.matches' -o=json \
		${PGK}/package.yml \
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
