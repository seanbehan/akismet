require File.dirname( __FILE__ ) + '/akismet_test'

class ClientTest < AkismetTest

  def setup
    super
    @client = Akismet::Client.new @key, @home_url
  end

  def test_verify_key
    assert [ true, false ].include?( @client.verify_key )
  end

  def test_check
    assert [ true, false ].include?( @client.check( 'ip', 'ua' ) )
  end

  def test_ham
    assert_nil @client.ham( 'ip', 'ua' )
  end

  def test_spam
    assert_nil @client.spam( 'ip', 'ua' )
  end

  def test_check_returns_true_on_spam
    assert @client.check( 'ip',
      'ua',
      :comment_author => 'viagra-test-123' )
  end

end