class TweetsController < ApplicationController
  def index
    @tweets = if params[:category].present?
                Tweet.
                  where("tweets.category LIKE ?", "%#{params[:category]}%").
                  order("tweeted_at DESC")
              else
                Tweet.all
              end
    render json: @tweets, status: :ok
  end
end
