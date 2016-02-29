module UrlExpander
  module Expanders
    class OnIoNine < UrlExpander::Expanders::Basic
      # http://on.io9.com/Z7P682F
      PATTERN = %r{(http://on\.io9\.com(/.+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://on.io9.com'
      end
    end
  end
end
