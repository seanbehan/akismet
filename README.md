Akismet
=======

A Ruby client for the Akismet API.

Usage
-----

Call `Akismet::verify_key` to verify an API key. Instantiate an
`Akismet::Client` with your API and site URL. Call the client's `check`,
`ham`, and `spam` methods, passing the commenter's IP and user agent and
parameters specified in the Akismet documentation:
http://akismet.com/development/api/#comment-check.

Example
-------

    Akismet.verify_key 'my_api_key', 'http://mysite.com'

    client = Akismet::Client.new 'my_api_key', 'http://mysite.com'

    client.check '173.194.35.104',
      'user_agent',
      :permalink => 'http://mysite.com/post/100',
      :comment_type => Akismet::CommentType::COMMENT,
      :comment_author => 'commenter_name',
      :comment_author_email => 'commenter@commenter.com',
      :comment_author_url => 'http://commenter.com',
      :comment_content => 'The text of a comment'
