# GitLab Support snippets for Espanso.org

An experiment in GitLab-shared text expansions/snippets.
See also [our discussion in support-team-meta#3539](https://gitlab.com/gitlab-com/support/support-team-meta/-/issues/3539#note_597649648).

## Prerequisites

The following gems are needed in order to use our (GitLab) expansions:

```shell
gem install httparty nokogiri
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

### Development dependencies

Appending the up-to-date list of triggers and espansions requires:

- awk
- jq
- Make
- perl
- yq

## Other useful/noteworthy Espanso packages

- @katrinleinweber's [effective-markdown](https://github.com/katrinleinweber/espanso-effective-markdown) & [greetings-english](https://github.com/katrinleinweber/espanso-greetings-english)
- [Mac Symbols](https://hub.espanso.org/packages/mac-symbols/)
- [Shruggie](https://hub.espanso.org/packages/shruggie/)
- [What the Commit](https://hub.espanso.org/packages/wtc/)

## List of included espansions

Trigger | Espansion
------- | ---------
`/glsar` | `shortly after reproducing the problem once more.`
`[gsos` | `[our GitLabSOS tool](https://gitlab.com/gitlab-com/support/toolbox/gitlabsos#run-the-script) {{glsar}}`
`[ksos` | `[our KubeSOS tool](https://gitlab.com/gitlab-com/support/toolbox/kubesos#kubesos) {{glsar}}`
`/stc` | `/label ~"Support Team Contributions"\n/assign me\n/assign_reviewer @\n/milestone %14.`
`/glt` | `{{title}}`
`/glr` | `{{refer}}`
`[tr)` | `[{{title}} ({{refer}})]({{clipboard}})`
`~cc` | `A ~customer [internally]({{clipboard}}) is $\|$:\n\n> `
`~pcc` | `A ~"GitLab Premium" ~customer [internally]({{clipboard}}) is $\|$:\n\n> `
`~ucc` | `A ~"GitLab Ultimate" ~customer [internally]({{clipboard}}) is $\|$:\n\n> `
`~lpcc` | `A large ~"GitLab Premium" ~customer [internally]({{clipboard}}) is $\|$:\n\n> `
`~lucc` | `A large ~"GitLab Ultimate" ~customer [internally]({{clipboard}}) is $\|$:\n\n> `
`[sst` | `See [Slack thread]({{clipboard}})\n\n> $\|$`
`.gcy` | `.gitlab-ci.yml`
`/eg` | `/etc/gitlab/`
`.grb` | `gitlab.rb`
`.gsj` | `gitlab-secrets.json`
`/vlg` | `/var/log/gitlab/`
`/og` | `/opt/gitlab/`
`/ebg` | `{{og}}embedded/bin/git`
`/vog` | `/var{{og}}`
`/glb` | `{{vog}}backups`
`/gctl` | `sudo gitlab-ctl tail \| tee /tmp/gl-{{clipboard}}-$\|$.txt`
`/glcf` | `sudo gitlab-ctl reconfigure`
`/glst` | `sudo gitlab-ctl status`
`/glrt` | `sudo gitlab-ctl restart`
`/glsp` | `sudo gitlab-ctl stop`
`(urg` | `([using ripgrep there](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md))`
`[Rc` | `[Rails console](https://docs.gitlab.com/ee/administration/operations/rails_console.html)`
`<ds` | `<details><summary>$\|$</summary>{{clipboard}}<details>`
`:tfe` | `:thread: for emergency :point_up:`
