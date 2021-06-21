#!/bin/env ruby
# frozen_string_literal: true

# Progressively remove non-ID (and superfluous) URL parts
# https://github.com/federico-terzi/espanso/issues/487#issuecomment-858903403

require 'nokogiri'
require 'httparty'
require 'pry'

class Title
  attr_reader :url

  def initialize(url)
    @url = url || ''
  end

  def construct
    return '' if url.nil? || url.empty?

    page = HTTParty.get(url)
    body = Nokogiri::HTML(page.body)

    body
      .at_xpath('/html/head/title/text()')
      .text
      .split(' (')
      .first
  end
end

puts Title.new(url = ENV['ESPANSO_CLIPBOARD']).construct
