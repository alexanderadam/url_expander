module UrlExpander
  module Expanders
    #
    # Expand bit.ly URLS
    # Usage:
    # UrlExpander::Client.expand("http://flip.it/1234qwer")
    #
    class Flipit < UrlExpander::Expanders::Basic
      PATTERN = %r{(https?://flip\.it(/[\w/]+))}
      attr_reader :parent_klass

      def initialize(short_url = '', options = {})
        @parent_klass = self
        super(short_url, options)
      end

      class Request
        include HTTParty
        base_uri 'http://flip.it'
      end
    end
  end
end
