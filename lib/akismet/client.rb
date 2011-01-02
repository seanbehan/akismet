module Akismet
  class Client

    attr_accessor :api_key, :home_url

    def initialize( api_key, home_url )
      @api_key = api_key
      @home_url = home_url
      @service = Service.new
    end

    def verify_key
      @service.verify_key @api_key, @home_url
    end

    def check( user_ip, user_agent, params = {} )
      @service.comment_check @api_key,
        @home_url,
        user_ip,
        user_agent,
        params
    end

    def ham( user_ip, user_agent, params = {} )
      @service.submit_ham @api_key,
        @home_url,
        user_ip,
        user_agent,
        params
    end

    def spam( user_ip, user_agent, params = {} )
      @service.submit_spam @api_key,
        @home_url,
        user_ip,
        user_agent,
        params
    end

  end
end
