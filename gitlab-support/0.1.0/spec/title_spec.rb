# frozen_string_literal: true

require_relative '../title'

RSpec.describe Title do
  describe '#construct' do
    it 'gets title from a GitHub issue' do
      url = 'https://github.com/federico-terzi/espanso/issues/487#issuecomment-858903403'
      expect(Title.new(url).construct)
        .to eq('[feature] regular expression search and replace support on variables')
    end

    it 'gets title from a GitLab issue with comment' do
      url = 'https://gitlab.com/gitlab-com/support/support-team-meta/-/issues/3539#note_597649648'
      expect(Title.new(url).construct)
        .to eq('Investigate Espanso.org for shared text expansion/snippets')
    end

    it 'gets title from a GitLab issue with design' do
      url = 'https://gitlab.com/gitlab-org/gitlab/-/issues/332281/designs/slack-notifications-current.png'
      expect(Title.new(url).construct)
        .to eq('Integration settings template: Slack notifications')
    end

    it 'gets title from a GitLab MR with diff' do
      url = 'https://gitlab.com/gitlab-com/support/toolbox/espanso/-/merge_requests/1/diffs'
      expect(Title.new(url).construct)
        .to eq('Enabling url and name mapping for issues')
    end

    it 'gets title from a GitLab epic' do
      url = 'https://gitlab.com/groups/gitlab-com/support/toolbox/-/epics/1'
      expect(Title.new(url).construct)
        .to eq('Support bot')
    end

    it 'returns empty for empty input' do
      expect(Title.new(ENV['SOME_CLIPBOARD']).construct)
        .to eq ('')
    end
  end
end
