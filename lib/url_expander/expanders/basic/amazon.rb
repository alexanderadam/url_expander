module UrlExpander
  module Expanders
    class Amazon < UrlExpander::Expanders::Basic
      PATTERN = %r{(http://amzn\.to(/.+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://amzn.to'
      end
    end
  end
end
