module UrlExpander
  module Expanders
    class Ifttt < UrlExpander::Expanders::Basic

      PATTERN = %r'(http://ift\.tt(/.+))'
      attr_reader :parent_klass

      def initialize(short_url="", options={})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://ift.tt'
      end

    end
  end
end