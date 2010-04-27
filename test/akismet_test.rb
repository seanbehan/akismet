require 'test/unit'
require File.dirname( __FILE__ ) + '/../lib/akismet'

class AkismetTest < Test::Unit::TestCase
  def setup
    # jonahb2's personal key
    @key = 'ecd2022d3247'
    @home_url = 'http://example.com'
    @service = Akismet::Service.new
  end

  def test_verify_key_fails_with_invalid_key
    assert !@service.verify_key( 'bad_key', '' )
  end
  
  def test_verify_key_fails_with_invalid_home_url
    assert !@service.verify_key( @key, '' )
  end
  
  def test_verify_key_succeeds
    assert @service.verify_key( @key, @home_url )
  end

  def test_check_comment_returns_true_for_spam
    # the author 'viagra-test-123' always triggers a true response
    assert @service.comment_check( @key,
      @home_url,
      '123.123.123.123',
      'Test user-agent',
      :permalink => 'http://example.com',
      :comment_type => Akismet::CommentType::COMMENT,
      :comment_author => 'viagra-test-123',
      :comment_author_email => 'test@example.com',
      :comment_author_url => 'http://example.com',
      :comment_content => 'Here is the content' ) 
  end

  def test_check_comment_returns_true_for_spam_with_minimal_parameters
    assert @service.comment_check( @key,
      @home_url,
      '123.123.123.123',
      'Test user-agent',
      :comment_author => 'viagra-test-123' )
  end

  def test_submit_ham
    assert_nil @service.submit_ham( @key,
      @home_url,
      '123.123.123.123',
      'Test user-agent' )
  end

  def test_submit_spam
    assert_nil @service.submit_ham( @key,
      @home_url,
      '123.123.123.123',
      'Test user-agent' )
  end
end