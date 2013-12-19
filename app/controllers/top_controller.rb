class TopController < ApplicationController
  skip_before_filter :authenticate

  # トップ
  def index
    @tweets = Tweet.includes(:sentence).last(50)
  end
end
