require 'rubygems'
require 'twitter'
class Tweet
  def initialize
    @text = <<-EOF.split("\n")
    test
    EOF
    Twitter.configure do |config|
      config.consumer_key       = 'xsM7nILONH7wgCxlgtN6UdjPo'
      config.consumer_secret    = ' QodZKmPx6WhWcb4zOj5F0f0X10Xym5vamaRhKtMEl8MJpGN7VQ'
      config.oauth_token        = '1005111898776350720-BNg1bhCR03JtJrW5QGhYyBnjSLxIrD'
      config.oauth_token_secret = 'CKqb7CEiKGk6bVZ0tsGuIbQaQaiI7wZFmwQrg5kenFcEB'
    end
  end
  def random_tweet
    tweet = @text[rand(@text.length)]
    update(tweet)
  end
  def daily_tweet
    tweet = @text[0]
    update(tweet)
  end
  private
  def update(tweet)
    return nil unless tweet
    begin
      Twitter.update(tweet.chomp)
    rescue => ex
      nil # todo
    end
  end
end
