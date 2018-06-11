require 'twitter'
require 'csv'
require 'json'


class Tweet
  def initialize
    @text = eval(File.read('date.rb'))
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'xsM7nILONH7wgCxlgtN6UdjPo'
      config.consumer_secret = 'QodZKmPx6WhWcb4zOj5F0f0X10Xym5vamaRhKtMEl8MJpGN7VQ'
      config.access_token = '1005111898776350720-BNg1bhCR03JtJrW5QGhYyBnjSLxIrD'
      config.access_token_secret = 'CKqb7CEiKGk6bVZ0tsGuIbQaQaiI7wZFmwQrg5kenFcEB'
    end
  end
  def random_tweet
    cont_id = rand(1..1).to_s
    tweet = @text['1']
    puts tweet,cont_id
    up_data(tweet,cont_id)
  end

  def up_data(tweet,cont_id)
    begin
      photo_path = "photo/gekikara" + cont_id + ".jpg"
      image_2 = open(photo_path)
      @client.update_with_media(tweet,image_2)
    rescue => e
      nil
    end
  end
  private :up_data
end


if __FILE__ == $0
  Tweet.new.random_tweet
end

