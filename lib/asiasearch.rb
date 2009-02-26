require 'rubygems'
require 'hpricot'
require 'mechanize'
require 'json'

class AsiaSearch
  attr_reader :appid, :content, :threshold, :maxnum
  def initialize
    @paths = {
      :ke         => "http://asia.search.yahooapis.com/cas/v1/ke",
      :ws         => "http://asia.search.yahooapis.com/cas/v1/ws",
    }
  end
  
  def ws(appid, content)
    agent = WWW::Mechanize.new
    params = {
      :appid => appid,
      :content => content,
      :format => "json"
    }

    agent.post(@paths[:ws],params)
    data = agent.current_page.body
    result = JSON.parse(data)
    return result
  end
  
  def ke(appid,content,threshold=30,maxnum=10)
    agent = WWW::Mechanize.new
    params = {
      :appid => appid,
      :content => content,
      :threshold => threshold,
      :maxnum => maxnum,
      :format => "json"
    }

    agent.post(@paths[:ke],params)
    data = agent.current_page.body
    result = JSON.parse(data)
    return result
  end
end