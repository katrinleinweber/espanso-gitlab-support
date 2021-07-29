# GitLab Support snippets for Espanso.org

An experiment in GitLab-shared text expansions/snippets.
See also [our discussion in support-team-meta#3539](https://gitlab.com/gitlab-com/support/support-team-meta/-/issues/3539#note_597649648).

## Prerequisites

The following gems are needed in order to use our (GitLab) expansions:
```
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

- trigger: "[gsos"
  - replace: "[our `GitLabSOS` tool](https://gitlab.com/gitlab-com/support/toolbox/gitlabsos#run-the-script) shortly after reproducing the problem once more."

- trigger: "[ksos"
  - replace: "[our `KubeSOS` tool](https://gitlab.com/gitlab-com/support/toolbox/kubesos#kubesos) shortly after reproducing the problem once more."

- trigger: "/stc"
  - replace: "/label ~\"Support Team Contributions\"\n/assign me\n/assign_reviewer @"

- trigger: '""title'
  - replace: "\"{{title}}\""

- trigger: '()refer'
  - replace: "({{refer}})"

- trigger: '["('
  - replace: "[$|$ {{title}} {{refer}}]({{clipboard}})"

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

- trigger: 'gctl'
  - replace: 'sudo gitlab-ctl tail | tee /tmp/gl-{{clipboard}}-$|$.txt'
