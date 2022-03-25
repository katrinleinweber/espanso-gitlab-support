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

[Install and activate lefthook](https://github.com/evilmartians/lefthook/blob/master/docs/full_guide.md#installation)
to benefit from the `pre-commit` automations.

### Development dependencies

Appending the up-to-date table of triggers and espansions requires:
Make, perl, awk,
[jq](https://stedolan.github.io/jq/), and
[yq](https://mikefarah.gitbook.io/yq/).

If you don't want to install all those, you can
[skip the (left)hooks](https://github.com/evilmartians/lefthook/blob/master/docs/full_guide.md#skip-lefthook-execution).

## Other useful/noteworthy Espanso packages

- @katrinleinweber's [effective-markdown](https://github.com/katrinleinweber/espanso-effective-markdown) & [greetings-english](https://github.com/katrinleinweber/espanso-greetings-english)
- [Mac Symbols](https://hub.espanso.org/packages/mac-symbols/)
- [Shruggie](https://hub.espanso.org/packages/shruggie/)
- [What the Commit](https://hub.espanso.org/packages/wtc/)

## List of included espansions

Trigger | Espansion
------- | ---------
``` /sartpom ``` | ``` shortly after reproducing the problem once more. ```
``` /itarf ``` | ``` in the affected repository folder (which needs to be a full, up-to-date clone) ```
``` [gsos ``` | ``` [run our `GitLabSOS` script](https://gitlab.com/gitlab-com/support/toolbox/gitlabsos#run-the-script) {{sartpom}} ```
``` [ksos ``` | ``` [run our `KubeSOS` script](https://gitlab.com/gitlab-com/support/toolbox/kubesos#kubesos) {{sartpom}} ```
``` [gfs ``` | ``` [run `fast-stats $\|$`](https://gitlab.com/gitlab-com/support/toolbox/fast-stats/#when-to-use-it) (binaries available [here](https://gitlab.com/gitlab-com/support/toolbox/fast-stats/-/releases)) ```
``` [gsz ``` | ``` [run `git-sizer`](https://github.com/github/git-sizer#getting-started) {{itarf}} ```
``` [gfr ``` | ``` [run `git filter-repo --analyze`](https://github.com/newren/git-filter-repo/#how-do-i-install-it) {{itarf}} ```
``` /stc ``` | ``` /label ~"Support Team Contributions"\n/assign me\n/assign_reviewer \n/milestone %14. ```
``` /ber ``` | ``` bundle exec rspec {{clipboard}}\n ```
``` /glt ``` | ``` {{title}} ```
``` /glref ``` | ``` {{refer}} ```
``` [tr) ``` | ``` [{{title}} ({{refer}})]({{clipboard}}) ```
``` [rt) ``` | ``` [{{refer}} ({{title}})]({{clipboard}}) ```
``` [r) ``` | ``` [{{refer}}]({{clipboard}}) ```
``` ~cfb ``` | ``` - Link to request: {{clipboard}} (internal)\n- Priority: ~customer priority::$\|$ \n- Why interested: \n- Current solution for this problem: \n- Impact to the customer of not having this: \n- Questions: \n- PM to mention: @ ```
``` [sst ``` | ``` See [Slack thread]({{clipboard}})\n\n> $\|$ ```
``` .gcy ``` | ``` .gitlab-ci.yml ```
``` /eg ``` | ``` /etc/gitlab/ ```
``` .grb ``` | ``` gitlab.rb ```
``` .gsj ``` | ``` gitlab-secrets.json ```
``` /vlg ``` | ``` /var/log/gitlab/ ```
``` /og ``` | ``` /opt/gitlab/ ```
``` /ebg ``` | ``` sudo -u git {{og}}embedded/bin/git ```
``` /vog ``` | ``` /var{{og}} ```
``` /vob ``` | ``` {{vog}}backups ```
``` /vodr ``` | ``` {{vog}}git-data/repositories/{{clipboard}} ```
``` /gctl ``` | ``` sudo gitlab-ctl tail \| tee /tmp/gl-{{clipboard}}-$\|$.txt ```
``` /glcf ``` | ``` sudo gitlab-ctl reconfigure ```
``` /glst ``` | ``` sudo gitlab-ctl status ```
``` /glrt ``` | ``` sudo gitlab-ctl restart ```
``` /glsp ``` | ``` sudo gitlab-ctl stop ```
``` &sde ``` | ``` shutdown && exit ```
``` /glsri ``` | ``` # Support-Resource initialization with a minimal configuration,\n# pinned version & some useful configs\nGRB=/etc/gitlab/gitlab.rb\n\n# Block Gravatar\nsudo echo '127.0.0.1 gravatar.com' >> /etc/hosts\n\n# Clear config file & insert a few useful items\nsudo sed \\\n    -e 's/#.*$//;/^$/d' \\\n    --in-place=.ori \\\n    $GRB && \\\necho "gitlab_rails['usage_ping_enabled'] = false" >> $GRB && \\\necho "logging['logrotate_frequency'] = nil" >> $GRB && \\\necho "logging['logrotate_size'] = '5G'" >> $GRB && \\\nsudo gitlab-ctl reconfigure\n\napt install --yes ripgrep jq\n\nsudo apt-mark hold {*g,g}itlab* && \\\nsudo apt --yes upgrade\nsudo reboot\n ```
``` *(Q ``` | ``` **(Q$\|$)**  ```
``` (urg ``` | ``` ([using `ripgrep` there](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md)) ```
``` [jq ``` | ``` [jq](https://docs.gitlab.com/ee/administration/troubleshooting/log_parsing.html) ```
``` [sd ``` | ``` [sd](https://github.com/chmln/sd#sd---search--displace) ```
``` [Rc ``` | ``` [Rails console](https://docs.gitlab.com/ee/administration/operations/rails_console.html) ```
``` <ds ``` | ``` <details><summary>$\|$</summary>{{clipboard}}</details> ```
``` c-a-b: ``` | ``` Co-authored-by: $\|$ <@gitlab.com> ```
``` [ZD ``` | ``` [ZD {{clipboard}}](https://gitlab.zendesk.com/agent/tickets/{{clipboard}}) ```
``` :glspair ``` | ``` :pair: :support-tanuki: $\|${{refer}} ```
``` :tfcc ``` | ``` :thread: for customer call about :zendesk: . cc @ ```
``` :tfe ``` | ``` :thread: for emergency :point_up: ```
