require 'mechanize'
require 'json'

module AsiaSearch
  class Error < StandardError; end

  def self.config(environment=RAILS_ENV)
    @config ||= {}
    @config[environment] ||= YAML.load(File.open(RAILS_ROOT + '/config/asiasearch.yml').read)[environment]
  end

  module Base
    extend ActiveSupport::Concern
    
    included do
    end
    
    module ClassMethods
      def has_keyword(column_name, options = {})
        define_method "keyword_content" do
          self.send(column_name)
        end
      end
    end

    module InstanceMethods
      attr_reader :threshold, :maxnum
      
      KE = "http://asia.search.yahooapis.com/cas/v1/ke"
      WS = "http://asia.search.yahooapis.com/cas/v1/ws"
      

      def ws
        params = {
          :content => keyword_content,
        }
        result = request(WS, params)
        return result
      end

      def ke(maxnum=5,threshold=30)
        params = {
          :content => keyword_content,
          :threshold => threshold,
          :maxnum => maxnum,
        }
        result = request(KE, params)
        return result
      end

      def request(path, params)
        agent = Mechanize.new
        appid = AsiaSearch.config["appid"]
        
        params.merge!({:appid => appid, :format => "json" })
        
        agent.post(path,params)
        data = agent.current_page.body
        result = JSON.parse(data)
        return result
      end
      
    end
  end
end
