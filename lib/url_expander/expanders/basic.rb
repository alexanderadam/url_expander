module UrlExpander
  module Expanders
    #
    # This is the basic class for all simple Net::HTTPMovedPermanently
    # Each subclass must define a url Pattern and a Reqest class for httpartty.
    # Ex:
    # module UrlExpander
    #  module Expanders
    #    class Tinyurl < UrlExpander::Expanders::Basic
    #      class Request
    #        include HTTParty
    #        base_uri 'http://tinyurl.com'
    #      end
    #
    #      PATTERN = %r'(http://tinyurl\.com(/[\w/]+))'
    #      attr_reader :parent_klass
    #
    #      def initialize(short_url="",options={})
    #        @parent_klass = self
    #        super(shot_url,options)
    #      end
    #    end
    #  end
    # end
    #
    # Usage:
    # client = UrlExpander::Client.new
    # client.expand("http://tinyurl.com/asdf")
    #
    class Basic
      attr_accessor :long_url
      attr_reader :parent_klass, :short_url

      def initialize(short_url = '', _options = {})
        @short_url = short_url
        if parent_klass.nil?
          @long_url = fetch_url short_url
        elsif short_url.match(parent_klass.class::PATTERN)
          @long_url = parent_klass.fetch_url(Regexp.last_match(2))
        else
          raise 'invalid pattern'
        end
      end

      protected

      def http_client
        return HTTParty if parent_klass.nil?

        parent_klass.class::Request
      end

      def parse_body_url(path)
        result = http_client.get path, follow_redirects: false
        doc = Hpricot(result.response.body)
        refresh_tag = (doc/"meta[@http-equiv='refresh']").first
        return if refresh_tag.nil?

        redirect_path = refresh_tag.attributes['content'].split(/url=/i).last
        redirect_uri = URI.parse(redirect_path)
        current_uri = URI.parse path
        if !current_uri.hostname.nil? && redirect_uri.hostname.nil?
          redirect_uri.hostname = current_uri.hostname
          redirect_uri.scheme = current_uri.scheme
        end

        redirect_uri.to_s
      end

      # Common fetcher used by most of my expanders.
      def fetch_url(path, http_verb = :head)
        url = nil
        result = http_client.public_send http_verb, path, follow_redirects: false

        case result.response
        when HTTParty::Response
        when Net::HTTPOK
          url = parse_body_url(path) || path
        when Net::HTTPMovedPermanently
          url = result['Location']
        when Net::HTTPFound
          url = result['location']
        when Net::HTTPNotFound
          url = path
        when Net::HTTPTemporaryRedirect
          url = result['location']
        when Net::HTTPMethodNotAllowed # move on with get instead post
          url = fetch_url path, :get
        end

        raise UrlExpander::RedirectLocationNotReceived.new(result) if url.nil?

        url
      end
    end
  end
end
