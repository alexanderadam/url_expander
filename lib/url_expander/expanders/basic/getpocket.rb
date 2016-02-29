module UrlExpander
  module Expanders
    
    #
    # Expand Pocket URLS
    # Usage:
    # UrlExpander::Client.expand("http://getpocket.com/s/bDnr")
    #
    class Getpocket < UrlExpander::Expanders::Basic
      
      PATTERN = %r'(http://getpocket\.com(/[\w/]+))'
      attr_reader :parent_klass
      
      def initialize(short_url="", options={})
        @parent_klass = self
        super(short_url, options)
      end
      
      class Request
        include HTTParty
        base_uri 'http://getpocket.com'
      end
    end
  end
end