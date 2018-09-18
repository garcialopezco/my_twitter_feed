class TweetsController < ApplicationController
  def index
    @tweets = if params[:category].present?
                Tweet.where("tweets.category LIKE ?", "%#{params[:category]}%")
              else
                Tweet.all
              end
    render json: @tweets, status: :ok
  end
end
