module UrlExpander
  module Expanders
    class Fortune < UrlExpander::Expanders::Basic
      PATTERN = %r{(http://for\.tn(/.+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://for.tn'
      end
    end
  end
end
