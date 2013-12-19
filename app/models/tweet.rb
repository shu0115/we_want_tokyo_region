class Tweet < ActiveRecord::Base
  belongs_to :sentence

  private

  ## ランダムツイート
  # Tweet.random_tweet
  def self.random_tweet
    auth = Authentication.where(nickname: 'tokyo_region').first

    # Twitter接続設定
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Settings.twitter_key
      config.consumer_secret     = Settings.twitter_secret
      config.access_token        = auth.token
      config.access_token_secret = auth.secret
    end

    ids      = Sentence.pluck(:id)
    sentence = Sentence.find_by(id: ids.sample)

    # Twitter投稿
    client.update("#{sentence.words}")
  end
end
