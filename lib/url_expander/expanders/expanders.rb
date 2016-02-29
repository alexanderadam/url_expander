$:.unshift(File.dirname(__FILE__))

require 'url_expander/expanders/basic'
require 'url_expander/expanders/api'
require 'url_expander/expanders/scrape'


module UrlExpander
  module Expanders
    autoload :Adjix, 'basic/adjix'
    autoload :Amazon, 'basic/amazon'
    autoload :Bitly, 'basic/bitly'
    autoload :Buffer, 'basic/buffer'
    autoload :DailyStar, 'basic/daily_star'
    autoload :Digbig, 'basic/digbig'
    autoload :Dlvrit, 'basic/dlvrit'
    autoload :Doiop, 'basic/doiop'
    autoload :Easyurljp, 'basic/easyurljp'
    autoload :Fbme, 'basic/fbme'
    autoload :Fortune, 'basic/fortune'
    autoload :Getpocket, 'basic/getpocket'
    autoload :GoogleFeedProxy, 'basic/google_feed_proxy'
    autoload :GoogleNews, 'basic/google_news'
    autoload :Guardian, 'basic/guardian'
    autoload :Ifttt, 'basic/ifttt'
    autoload :IndieGoGo, 'basic/indie_go_go'
    autoload :Itunes, 'basic/itunes'
    autoload :Justas, 'basic/justas'
    autoload :LinkedIn, 'basic/linked_in'
    autoload :Mirror, 'basic/mirror'
    autoload :Moourl, 'basic/moourl'
    autoload :Notlong, 'basic/notlong'
    autoload :Nutshellurl, 'basic/nutshellurl'
    autoload :OnIoNine, 'basic/on_io_nine'
    # autoload :Owly, 'basic/owly'
    autoload :Plizy, 'basic/plizy'
    autoload :Pocket, 'basic/pocket'
    autoload :Shrtst, 'basic/shrtst'
    autoload :SkollWorldForum, 'basic/skoll_world_forum'
    autoload :Snipurl, 'basic/snipurl'
    autoload :SomeECards, 'basic/some_e_cards'
    autoload :Supr, 'basic/supr'
    autoload :T11me, 'basic/t11me'
    autoload :Tco, 'basic/tco'
    autoload :Tighturl, 'basic/tighturl'
    autoload :Tinycc, 'basic/tinycc'
    autoload :Tinyurl, 'basic/tinyurl'
    autoload :Tnwto, 'basic/tnwto'
    autoload :Dlvrit, 'basic/dlvrit'
    autoload :Vsbli, 'basic/vsbli'


    # Using API
    # autoload :Bitly, 'api/bitly'


    autoload :Tribal, 'basic/tribal'
    autoload :Tumblr, 'basic/tumblr'
    autoload :Twurlnl, 'basic/twurlnl'
    autoload :Ur1ca, 'basic/ur1ca'
    autoload :Urlie, 'basic/urlie'
    autoload :VentureBeat, 'basic/venture_beat'
    autoload :Virgin, 'basic/virgin'
    autoload :Wordpress, 'basic/wordpress'
    autoload :WorldEconomicForum, 'basic/world_economic_forum'
    autoload :Youtube, 'basic/youtube'

    # Using API
    autoload :Budurl, 'api/budurl'
    autoload :Cligs, 'api/cligs'
    autoload :Isgd, 'api/isgd'
    autoload :Googl, 'api/googl'
    autoload :Decenturl, 'api/decenturl'
    autoload :Xrlus, 'api/xrlus'
    autoload :Dldbz, 'api/dldbz'

    # Using Scraper
    autoload :Qsrli, 'scrape/qsrli'
    autoload :Shorl, 'scrape/shorl'
    autoload :Simurl, 'scrape/simurl'

  end
end
