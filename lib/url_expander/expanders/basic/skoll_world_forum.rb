module UrlExpander
  module Expanders
    class SkollWorldForum < UrlExpander::Expanders::Basic

      PATTERN = %r'(http://skoll\.wf(/.+))'
      attr_reader :parent_klass

      def initialize(short_url="", options={})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://skoll.wf'
      end

    end
  end
end