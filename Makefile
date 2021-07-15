PGK=gitlab-support
VER=$$(/bin/ls ${PGK} \
	| sort --human-numeric-sort --reVERe \
	| head -1)

# Test locally, by running RSpec and
# copying latest yml to local package install
test:
	cd ${PGK}/${VER} \
		&& bundle exec rspec \
		&& cp -f \
			*.rb \
			package.yml \
			"$$(espanso path packages)/${PGK}/"
	espanso restart

# Reinstall from public master
reset:
	espanso uninstall ${PGK}
	espanso install ${PGK} --external  \
		https://github.com/katrinleinweber/espanso-${PGK}
	espanso restart

list:
	grep --color=never --extended-regexp '^\s+- trigger' \
		--after-context=1 \
		gitlab-support/**/package.yml \
	| sed -e 's/^--//g' \
	| sed -E 's/^ +- trigger:/- trigger:/g' \
	| sed -e 's/  replace:/- replace:/g' \
	>> README.md
