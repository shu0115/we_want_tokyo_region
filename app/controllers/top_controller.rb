class TopController < ApplicationController
  skip_before_filter :authenticate

  # トップ
  def index
    @tweets = Tweet.order(created_at: :desc).includes(:sentence).last(50)
  end
end
