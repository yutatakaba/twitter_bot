require 'twitter'
require 'csv'

class Tweet
  def initialize
    @text = {}
    CSV.foreach("date.csv", 'r') do |row|
      @text[row[0]] = row[1]
    end
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'xsM7nILONH7wgCxlgtN6UdjPo'
      config.consumer_secret = 'QodZKmPx6WhWcb4zOj5F0f0X10Xym5vamaRhKtMEl8MJpGN7VQ'
      config.access_token = '1005111898776350720-BNg1bhCR03JtJrW5QGhYyBnjSLxIrD'
      config.access_token_secret = 'CKqb7CEiKGk6bVZ0tsGuIbQaQaiI7wZFmwQrg5kenFcEB'
    end
  end
  def random_tweet
    tweet = @text["2"]
    p tweet
    up_data(tweet)
  end

  def up_data(tweet)
    begin
      @client.update(tweet)
    rescue => e
      nil
    end
  end
  private :up_data
end

if __FILE__ == $0
  Tweet.new.random_tweet
end

