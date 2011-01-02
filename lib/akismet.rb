require File.dirname( __FILE__ ) + '/akismet/version'
require File.dirname( __FILE__ ) + '/akismet/service'
require File.dirname( __FILE__ ) + '/akismet/client'

module Akismet

  # convenience method
  def self.verify_key( api_key, home_url )
    Service.new.verify_key api_key, home_url
  end

end