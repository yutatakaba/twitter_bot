require 'twitter'
require 'csv'

class Tweet
  def initialize
    @text = {}
    CSV.foreach("date.csv", 'r') do |row|
      @text[row[0]] = row[1]
    end
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ''
      config.consumer_secret = ''
      config.access_token = ''
      config.access_token_secret = ''
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

