require 'twitter'
require 'csv'
require 'json'
require 'open-uri'


class Tweet
  def initialize
    @text = eval(File.read('date.rb'))
    @photo = eval(File.read('photo.rb'))
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'xsM7nILONH7wgCxlgtN6UdjPo'
      config.consumer_secret = 'QodZKmPx6WhWcb4zOj5F0f0X10Xym5vamaRhKtMEl8MJpGN7VQ'
      config.access_token = '1005111898776350720-BNg1bhCR03JtJrW5QGhYyBnjSLxIrD'
      config.access_token_secret = 'CKqb7CEiKGk6bVZ0tsGuIbQaQaiI7wZFmwQrg5kenFcEB'
    end
  end
  def random_tweet
    cont_id = rand(1..10).to_s
    tweet = @text[cont_id]
    photo = open(@photo[cont_id])
    puts tweet,cont_id
    up_data(tweet,photo)
  end

  def up_data(tweet,photo)
    begin
      @client.update_with_media(tweet,photo)
    rescue => e
      nil
    end
  end
  private :up_data
end


if __FILE__ == $0
  Tweet.new.random_tweet
end

