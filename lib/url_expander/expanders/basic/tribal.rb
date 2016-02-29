module UrlExpander
  module Expanders
    #
    # Expand Tribal URLS
    # Usage:
    # UrlExpander::Client.expand("http://trib.al/VHFDWJg")
    #
    class Tribal < UrlExpander::Expanders::Basic
      PATTERN = %r{(http://trib\.al(/[\w/]+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://trib.al'
      end
    end
  end
end
