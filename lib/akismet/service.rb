require 'net/http'
require 'cgi'

module Akismet

  AKISMET_VERSION = 1.1
  PORT = 80
  HEADERS = { 'User-Agent' => "Ruby/Akismet #{ VERSION }" }

  module CommentType
    COMMENT = 'comment'
    TRACKBACK = 'trackback'
    PINGBACK = 'pingback'
  end

  class Service

    def verify_key( api_key, home_url )
      response = invoke( 'verify-key', 'rest.akismet.com', :blog => home_url,
        :key => api_key )

      response.is_a?( Net::HTTPOK ) && response.body == 'valid'
    end

    # params to the following 3 methods may include:
    #  permalink
    #  content_type
    #  comment_author
    #  comment_author_email
    #  comment_author_url
    #  comment_content
    #  others representing HTTP headers and server environment vars

    def comment_check( api_key, home_url, user_ip, user_agent, params = {} )
      response = invoke_comment_method 'comment-check', api_key, home_url,
        user_ip, user_agent, params
        
      response.is_a?( Net::HTTPOK ) && response.body == 'true'
    end

    def submit_ham( api_key, home_url, user_ip, user_agent, params = {} )
      invoke_comment_method 'submit-ham', api_key, home_url, user_ip,
        user_agent, params

      nil
    end

    def submit_spam( api_key, home_url, user_ip, user_agent, params = {} )
      invoke_comment_method 'submit-spam', api_key, home_url, user_ip,
        user_agent, params

      nil
    end
    
  private

    def invoke_comment_method( method_name, api_key, home_url, user_ip, user_agent, params = {} )
      host = "#{ api_key }.rest.akismet.com"

      params = params.merge :blog => home_url,
        :user_ip => user_ip,
        :user_agent => user_agent
      
      invoke method_name, host, params
    end

    # returns an HTTP response
    def invoke( method_name, host, params )
      path = "/#{ AKISMET_VERSION }/#{ method_name }"
      data = url_encode( params )
    
      Net::HTTP.start( host, PORT ) do |http|
        http.post( path, data, HEADERS )
      end
    end
  
    def url_encode( hash = {} )
      hash.collect do |k, v|
        "#{ CGI.escape( k.to_s ) }=#{ CGI.escape( v.to_s ) }"
      end.join( "&" )
    end
  
  end
end