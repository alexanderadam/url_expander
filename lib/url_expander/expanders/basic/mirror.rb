module UrlExpander
  module Expanders
    class Mirror < UrlExpander::Expanders::Basic
      PATTERN = %r{(http://mirr\.im(/.+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://mirr.im'
      end
    end
  end
end
