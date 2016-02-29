module UrlExpander
  module Expanders
    #
    # Expand Tinyurl URLS
    # Usage:
    # UrlExpander::Client.expand("http://tinyurl.com/66sekq5")
    #
    class Tinyurl < UrlExpander::Expanders::Basic
      PATTERN = %r{(http://tinyurl\.com(/[\w/]+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://tinyurl.com'
      end
    end
  end
end
