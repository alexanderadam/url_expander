require 'rubygems'
require 'httparty'
require 'set'

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'url_expander/expanders/expanders'
require 'url_expander/errors'

module UrlExpander
  class Client
    # Expand a given url.
    def self.expand(url = '', options = {}, limit = options[:limit] || 10)
      options = options.dup
      options[:visited_urls] ||= Set.new
      if options[:visited_urls].include? url
        return url
      else
        options[:visited_urls] << url
      end

      # Setup the default options
      options[:nested_shortening] = true unless options.key?(:nested_shortening)
      options[:config_file] = "#{ENV['HOME']}/url_expander_credentials.yml" unless options[:config_file]

      # We Reached the maximum number of redirections, quit.
      raise ArgumentError, 'HTTP redirect too deep' if options[:nested_shortening] && limit == 0

      # Make sure we have a url
      raise ArgumentError.new('Expander requires a short url') if url.nil? || url.empty?
      exclude_klasses = ['UrlExpander::Expanders::Basic', 'UrlExpander::Expanders::API', 'UrlExpander::Expanders::Scrape']

      # Get the names for all the expanders except the basic default one.
      mod = UrlExpander::Expanders
      expanders = mod.constants.collect { |c| mod.const_get(c) }.select { |c| c.class == Class && !exclude_klasses.include?(c.to_s) }
      expander_klass = nil

      # Find the correct expander
      expanders.each do |exp|
        if exp.respond_to?('is_me?')
          expander_klass = exp if exp.is_me?(url)
        elsif exp::PATTERN.match(url)
          expander_klass = exp
        end
      end

      if expander_klass.nil?
        @expander = UrlExpander::Expanders::Basic.new url, options
      else
        @expander = expander_klass.new url, options
      end

      if (@expander.nil? && !options[:is_redirection]) ||
          (!@expander.nil? && @expander.long_url.nil?)
        if options[:strict]
          raise ArgumentError.new('Unknown url')
        else
          url
        end
      elsif options[:nested_shortening] & !@expander.nil?
        limit -= 1
        options[:is_redirection] = true
        UrlExpander::Client.expand(@expander.long_url, options, limit)
      else
        @expander.nil? ? url : @expander.long_url
      end
    end
  end

  class Error < StandardError
    attr_reader :code
    alias msg message
    def initialize(msg, code)
      @code = code
      super("#{msg} - '#{code}'")
    end
  end
end
