module UrlExpander
  module Expanders
    
    #
    # Expand Bitly URLS
    # Usage:
    # UrlExpander::Client.expand("http://bit.ly/1c61ceP")
    #
    class Bitly < UrlExpander::Expanders::Basic
      
      PATTERN = %r'(http://bit\.ly(/[\w/]+))'
      attr_reader :parent_klass
      
      def initialize(short_url="", options={})
        @parent_klass = self
        super(short_url, options)
      end
      
      class Request
        include HTTParty
        base_uri 'http://bit.ly'
      end
    end
  end
end