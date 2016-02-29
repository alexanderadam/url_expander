module UrlExpander
  module Expanders
    class SomeECards < UrlExpander::Expanders::Basic
      PATTERN = %r{(http://some\.ly(/.+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://some.ly'
      end
    end
  end
end
