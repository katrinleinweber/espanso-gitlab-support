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

## Other useful/noteworthy Espanso packages

- @katrinleinweber's [effective-markdown](https://github.com/katrinleinweber/espanso-effective-markdown) & [greetings-english](https://github.com/katrinleinweber/espanso-greetings-english)
- [Mac Symbols](https://hub.espanso.org/packages/mac-symbols/)
- [Shruggie](https://hub.espanso.org/packages/shruggie/)
- [What the Commit](https://hub.espanso.org/packages/wtc/)

### List of available expansions

- trigger: '/glsar'
  - replace: 'shortly after reproducing the problem once more.'

- trigger: "[gsos"
  - replace: "[our `GitLabSOS` tool](https://gitlab.com/gitlab-com/support/toolbox/gitlabsos#run-the-script) {{glsar}}"

- trigger: "[ksos"
  - replace: "[our `KubeSOS` tool](https://gitlab.com/gitlab-com/support/toolbox/kubesos#kubesos) {{/glsar}}"

- trigger: "/stc"
  - replace: "/label ~\"Support Team Contributions\"\n/assign me\n/assign_reviewer @\n/milestone %14."

- trigger: '/glt'
  - replace: "{{title}}"

- trigger: '/glr'
  - replace: "{{refer}}"

- trigger: '[tr)'
  - replace: "[{{title}} ({{refer}})]({{clipboard}})"

- trigger: "~cc"
  - replace: "A ~customer [internally]({{clipboard}}) is $|$:\n\n> "

- trigger: "~pcc"
  - replace: "A ~\"GitLab Premium\" ~customer [internally]({{clipboard}}) is $|$:\n\n> "

- trigger: "~ucc"
  - replace: "A ~\"GitLab Ultimate\" ~customer [internally]({{clipboard}}) is $|$:\n\n> "

- trigger: "~lpcc"
  - replace: "A large ~\"GitLab Premium\" ~customer [internally]({{clipboard}}) is $|$:\n\n> "

- trigger: "~lucc"
  - replace: "A large ~\"GitLab Ultimate\" ~customer [internally]({{clipboard}}) is $|$:\n\n> "

- trigger: '[sst'
  - replace: "See [Slack thread]({{clipboard}})\n\n> $|$"

- trigger: '.gcy'
  - replace: '.gitlab-ci.yml'

- trigger: '/eg'
  - replace: '/etc/gitlab/'

- trigger: '.grb'
  - replace: 'gitlab.rb'

- trigger: '.gsj'
  - replace: 'gitlab-secrets.json'

- trigger: '/vlg'
  - replace: '/var/log/gitlab/'

- trigger: '/og'
  - replace: '/opt/gitlab/'

- trigger: '/ebg'
  - replace: "{{og}}embedded/bin/git"

- trigger: '/vog'
  - replace: "/var{{og}}"

- trigger: '/glb'
  - replace: "{{vog}}backups"

- trigger: '/gctl'
  - replace: 'sudo gitlab-ctl tail | tee /tmp/gl-{{clipboard}}-$|$.txt'

- trigger: '/glcf'
  - replace: 'sudo gitlab-ctl reconfigure'

- trigger: '/glst'
  - replace: 'sudo gitlab-ctl status'

- trigger: '/glrt'
  - replace: 'sudo gitlab-ctl restart'

- trigger: '/glsp'
  - replace: 'sudo gitlab-ctl stop'

- trigger: "(urg"
  - replace: "([using `ripgrep` there](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md))"

- trigger: "[Rc"
  - replace: "[Rails console](https://docs.gitlab.com/ee/administration/operations/rails_console.html)"

- trigger: "<ds"
  - replace: "<details><summary>$|$</summary>{{clipboard}}<details>"

- trigger: ':tfe'
  - replace: ':thread: for emergency :point_up:'
