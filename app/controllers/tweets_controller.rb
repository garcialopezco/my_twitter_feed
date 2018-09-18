class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    render json: @tweets, status: :ok
  end
end
