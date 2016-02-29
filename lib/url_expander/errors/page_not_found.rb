module UrlExpander
  class PageNotFound < StandardError
    def initialize(response)
      super("404 Page Not Found fetching #{response.request.base_uri}#{response.request.path}")
    end
  end
end