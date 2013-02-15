class Bitly < UrlExpander::Expanders::Basic
  PATTERN = %r'(https?://bit\.ly(/[\w/]+))'

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
