module UrlExpander
  module Expanders
    class IndieGoGo < UrlExpander::Expanders::Basic

      PATTERN = %r'(http://igg\.me(/.+))'
      attr_reader :parent_klass

      def initialize(short_url="", options={})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://igg.me'
      end

    end
  end
end