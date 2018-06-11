require 'twitter'
require 'csv'
require 'json'


class Tweet
  def initialize
    @text = eval(File.read('date.rb'))
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ''
      config.consumer_secret = ''
      config.access_token = ''
      config.access_token_secret = ''
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

