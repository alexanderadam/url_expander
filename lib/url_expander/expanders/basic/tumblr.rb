module UrlExpander
  module Expanders
    class Tumblr < UrlExpander::Expanders::Basic

      PATTERN = %r'(http://tmblr\.co(/.+))'
      attr_reader :parent_klass

      def initialize(short_url="", options={})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://tmblr.co'
      end

    end
  end
end