module UrlExpander
  module Expanders
    class LinkedIn < UrlExpander::Expanders::Basic
      PATTERN = %r{(http://lnkd\.in(/.+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://lnkd.in'
      end
    end
  end
end
