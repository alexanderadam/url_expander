module UrlExpander
  class RedirectLocationNotReceived < StandardError
    def initialize(response)
      super("Redirect Location not received fetching #{response.request.base_uri}#{response.request.path}")
    end
  end
end