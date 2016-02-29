module UrlExpander
  module Expanders
    class WorldEconomicForum < UrlExpander::Expanders::Basic

      PATTERN = %r'(http://wef\.ch(/.+))'
      attr_reader :parent_klass

      def initialize(short_url="", options={})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://wef.ch'
      end

    end
  end
end