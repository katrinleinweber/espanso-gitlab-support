# GitLab Support snippets for Espanso.org

An experiment in GitLab-shared text expansions/snippets.
See also [our discussion in support-team-meta#3539](https://gitlab.com/gitlab-com/support/support-team-meta/-/issues/3539#note_597649648).

## Prerequisites 

The following gems are needed in order to use our (GitLab) expansions:
```
sudo gem install httparty nokogiri
```

## Installation

Not yet possible [directly](https://espanso.org/docs/packages/#from-a-repository),
but as this repo is mirrored to GitHub, this works:

```shell
# espanso uninstall gitlab-support # In case you want to upgrade
espanso install gitlab-support --external  \
    https://github.com/katrinleinweber/espanso-gitlab-support
```

## Usage

Please review the list of triggers and replacement in [the `package.yml` file](gitlab-support/0.1.0/package.yml).

## Contributing

MRs are welcome! For major changes, please open an issue first to discuss what you would like to change.

## Other useful/noteworthy Espanso packages

- @katrinleinweber's [effective-markdown](https://github.com/katrinleinweber/espanso-effective-markdown) & [greetings-english](https://github.com/katrinleinweber/espanso-greetings-english)
- [Mac Symbols](https://hub.espanso.org/packages/mac-symbols/)
- [Shruggie](https://hub.espanso.org/packages/shruggie/)
- [What the Commit](https://hub.espanso.org/packages/wtc/)
