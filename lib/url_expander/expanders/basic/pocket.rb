module UrlExpander
  module Expanders
    #
    # Expand Pocket URLS
    # Usage:
    # UrlExpander::Client.expand("http://pocket.co/sbDK2")
    #
    class Pocket < UrlExpander::Expanders::Basic
      PATTERN = %r{(http://pocket\.co(/[\w/]+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://pocket.co'
      end
    end
  end
end
