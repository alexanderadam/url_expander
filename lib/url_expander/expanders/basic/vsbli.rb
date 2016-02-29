module UrlExpander
  module Expanders
    class Vsbli < UrlExpander::Expanders::Basic
      PATTERN = %r'(http://vsb\.li(/[\w/]+))'
      attr_reader :parent_klass

      def initialize(short_url="", options={})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://vsb.li'
      end
    end
  end
end
