require File.dirname( __FILE__ ) + '/akismet_test'

class ModuleTest < AkismetTest

  def test_verify_key
    assert Akismet.verify_key @key, @home_url
  end

end
