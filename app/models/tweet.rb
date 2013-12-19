class Tweet < ActiveRecord::Base
  belongs_to :sentence

  private

  ## ランダムツイート
  # Tweet.random_tweet
  def self.random_tweet
    result = ''
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
    hash_tag = Rails.env.production? ? '#heroku' : ''

    begin
      # Twitter投稿
      client.update("#{hash_tag} #{sentence.words}")
      result = 'Success'
    rescue => e
      puts "[ ---------- e ---------- ]" ; e.tapp ;
      result = e.message
    end

    Tweet.create(
      sentence_id: sentence.id,
      body:        "#heroku #{sentence.words}",
      result:      result
    )
  end
end
