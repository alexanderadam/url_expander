module UrlExpander
  module Expanders
    class GoogleNews < UrlExpander::Expanders::Basic
      PATTERN = %r{(http://news.google.com/news/url\?(/.+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://news.google.com'
      end
    end
  end
end
