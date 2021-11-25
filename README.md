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
`/glref` | `{{refer}}`
`[tr)` | `[{{title}} ({{refer}})]({{clipboard}})`
`[rt)` | `[{{refer}} ({{title}})]({{clipboard}})`
`[r)` | `[{{refer}}]({{clipboard}})`
`~cc` | `A customer [internally]({{clipboard}}) is $\|$:\n\n> `
`~pcc` | `A ~"GitLab Premium" customer [internally]({{clipboard}}) is $\|$:\n\n> `
`~ucc` | `A ~"GitLab Ultimate" customer [internally]({{clipboard}}) is $\|$:\n\n> `
`~lpcc` | `A large ~"GitLab Premium" customer [internally]({{clipboard}}) is $\|$:\n\n> `
`~lucc` | `A large ~"GitLab Ultimate" customer [internally]({{clipboard}}) is $\|$:\n\n> `
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
`&sde` | `shutdown && exit`
`/glsri` | `# Support-Resource initialization with a minimal configuration,\n# pinned version & some useful configs\nGRB=/etc/gitlab/gitlab.rb\n\n# Block Gravatar\nsudo echo '127.0.0.1 gravatar.com' >> /etc/hosts\n\n# Clear config file & insert a few useful items\nsudo sed \\\n    -e 's/#.*$//;/^$/d' \\\n    --in-place=.ori \\\n    $GRB && \\\necho "gitlab_rails['usage_ping_enabled'] = false" >> $GRB && \\\necho "logging['logrotate_frequency'] = nil" >> $GRB && \\\necho "logging['logrotate_size'] = '5G'" >> $GRB && \\\nsudo gitlab-ctl reconfigure\n\napt install --yes ripgrep jq\n\nsudo apt-mark hold {*g,g}itlab* && \\\nsudo apt --yes upgrade\nsudo reboot\n`
`(urg` | `([using ripgrep there](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md))`
`[Rc` | `[Rails console](https://docs.gitlab.com/ee/administration/operations/rails_console.html)`
`<ds` | `<details><summary>$\|$</summary>{{clipboard}}</details>`
`:glspair` | `:pair: :support-tanuki: $\|${{refer}}`
`:tfe` | `:thread: for emergency :point_up:`
