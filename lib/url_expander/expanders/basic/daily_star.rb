module UrlExpander
  module Expanders
    class DailyStar < UrlExpander::Expanders::Basic
      PATTERN = %r{(http://dly\.st(/.+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://dly.st'
      end
    end
  end
end
