class TweetsController < ApplicationController
  def index
    @tweets = if params[:category].present?
                Tweet.
                  where("tweets.category LIKE ?", "%#{params[:category]}%").
                  order("tweeted_at DESC").
                  limit(15)
              else
                Tweet.all.limit(15)
              end
    render json: @tweets, status: :ok
  end
end
