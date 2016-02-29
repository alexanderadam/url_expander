module UrlExpander
  module Expanders
    #
    # Expand easyurl.jp URLS
    # Usage:
    # UrlExpander::Client.expand("http://easyurl.jp/1qdv")
    #
    class Easyurljp < UrlExpander::Expanders::Basic
      PATTERN = %r{(http://easyurl\.jp(/[\w/]+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://easyurl.jp'
      end
    end
  end
end
