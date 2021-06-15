# frozen_string_literal: true

require_relative '../reference'

RSpec.describe Reference do
  describe '#construct' do
    it 'shortens a GitHub issue' do
      url = 'https://github.com/federico-terzi/espanso/issues/487#issuecomment-858903403'
      expect(Reference.new(url).construct)
        .to eq('federico-terzi/espanso#487')
    end

    it 'shortens a GitLab issue with comment' do
      url = 'https://gitlab.com/gitlab-com/support/support-team-meta/-/issues/3539#note_597649648'
      expect(Reference.new(url).construct)
        .to eq('support-team-meta#3539')
    end

    it 'shortens a GitLab issue with design' do
      url = 'https://gitlab.com/gitlab-org/gitlab/-/issues/332281/designs/slack-notifications-current.png'
      expect(Reference.new(url).construct)
        .to eq('gitlab#332281')
    end

    it 'shortens a GitLab MR with diff' do
      url = 'https://gitlab.com/gitlab-com/support/toolbox/espanso/-/merge_requests/1/diff'
      expect(Reference.new(url).construct)
        .to eq('toolbox/espanso!1')
    end

    it 'shortens a GitLab epic' do
      url = 'https://gitlab.com/groups/gitlab-com/support/toolbox/-/epics/1'
      expect(Reference.new(url).construct)
        .to eq('toolbox&1')
    end

    it 'raises an error for empty input' do
      expect(Reference.new(ENV['SOME_CLIPBOARD']).construct)
        .to raise_error(ArgumentError, 'Input is empty! Please use a URL.')
    end
  end
end
