module UrlExpander
  module Expanders
    class Buffer < UrlExpander::Expanders::Basic

      PATTERN = %r'(http://buff\.ly(/.+))'
      attr_reader :parent_klass

      def initialize(short_url="", options={})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://buff.ly'
      end

    end
  end
end