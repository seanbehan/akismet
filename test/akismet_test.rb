require 'test/unit'
require File.dirname( __FILE__ ) + '/../lib/akismet'

class AkismetTest < Test::Unit::TestCase

  def setup
    # akismet@jonahb.com's personal key
    @key = 'ecd2022d3247'
    @home_url = 'http://example.com'
    @service = Akismet::Service.new
  end

  def test_truth
    assert true
  end

end