#!/bin/env ruby
# frozen_string_literal: true

# Progressively remove non-ID (and superfluous) URL parts
# https://github.com/federico-terzi/espanso/issues/487#issuecomment-858903403
class Reference
  attr_reader :url

  def initialize(url)
    @url = url || ''
  end

  def construct
    raise(ArgumentError, 'Input is empty! Please use a URL.') if url.nil?

    url
      .sub(%r{^https?://git(la|hu)b.com}, '') # Remove domain
      .sub('/groups', '')                     # Remove entity prefix (for non-project epics)
      .sub(%r{^/gitlab-(com|org)}, '')        # Remove unnecessary top-level groups
      .sub(%r{[/\\]?#[\w-]+$}, '')            # Remove anchor text
      .sub(%r{[/\\](diff|design).*$}, '')     # Remove sub-entities
      .sub('/support', '')                    #   and sub-level group names
      .sub('/-', '')                          # Remove routing separator (gitlab#214217)
      .sub('/epics/',          '&')           # Replace
      .sub('/issues/',         '#')           #   type
      .sub('/merge_requests/', '!')           #   with
      .sub('/milestones/',     '%')           #   symbol
      .sub(%r{/+}, '/')                       # Remove additional,
      .delete_prefix('/')                     #   superfluous slashes
  end
end

puts Reference.new(ENV['ESPANSO_CLIPBOARD']).construct
