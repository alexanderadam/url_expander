module UrlExpander
  module Expanders
    #
    # Expand just.as URLS
    # Usage:
    # UrlExpander::Client.expand("http://just.as/amMF3i")
    #
    class Justas < UrlExpander::Expanders::Basic
      PATTERN = %r{(http://just\.as(/[\w/]+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://just.as'
      end
    end
  end
end
