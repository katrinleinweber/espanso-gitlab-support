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
    return '' if url.nil? || url.empty?

    url
      .then { |u| u.sub(%r{^https?://git(la|hu)b.com}, '') } # Remove domain
      .then { |u| u.sub('/groups', '') }                     # Remove entity prefix (for non-project epics)
      .then { |u| u.sub(%r{^/gitlab-(com|org)}, '') }        # Remove unnecessary top-level groups
      .then { |u| u.sub(%r{[/\\]?#[\w-]+$}, '') }            # Remove anchor text
      .then { |u| u.sub(%r{[/\\](diff|design).*$}, '') }     # Remove sub-entities
      .then { |u| u.sub('/support', '') }                    #   and sub-level group names
      .then { |u| u.sub('/-', '') }                          # Remove routing separator (gitlab#214217)
      .then { |u| u.sub('/epics/',          '&') }           # Replace
      .then { |u| u.sub('/issues/',         '#') }           #   type
      .then { |u| u.sub('/merge_requests/', '!') }           #   with
      .then { |u| u.sub('/milestones/',     '%') }           #   symbol
      .then { |u| u.sub(%r{/+}, '/') }                       # Remove additional,
      .then { |u| u.delete_prefix('/') }                     #   superfluous slashes
  end
end

puts Reference.new(ENV['ESPANSO_CLIPBOARD']).construct
