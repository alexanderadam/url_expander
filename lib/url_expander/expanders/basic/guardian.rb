module UrlExpander
  module Expanders
    class Guardian < UrlExpander::Expanders::Basic

      PATTERN = %r'(http://gu\.com(/.+))'
      attr_reader :parent_klass

      def initialize(short_url="", options={})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://gu.com'
      end

    end
  end
end