module UrlExpander
  module Expanders
    class GoogleFeedProxy < UrlExpander::Expanders::Basic
      PATTERN = %r{(http://feedproxy\.google\.com(/.+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://feedproxy.google.com'
      end
    end
  end
end
