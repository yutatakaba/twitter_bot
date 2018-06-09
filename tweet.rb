require 'twitter'
require 'csv'

class Tweet
  def initialize
    @text = {}
    CSV.foreach("date.csv", 'r') do |row|
      @text[row[0]] = row[1]
    end
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key       = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret    = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
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

