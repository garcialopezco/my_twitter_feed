class TweetsImporter
  attr_reader :categories

  def initialize(categories: [])
    @categories = categories   
  end

  def import!
    categories.each do |category|
      tweets = tweets_lookup.search(category)
      bulk_import(tweets, category)
    end
  end

  private
  
    def tweets_lookup
      @tweets_lookup ||= TweetsLookup.new
    end

    def bulk_import(tweets, category)
      tweets_hash = tweets.map { |tweet| tweet_hash(tweet, category) }
      Tweet.create! tweets_hash
    end

    def tweet_hash(tweet, category)
      {
        user_name: tweet.user.name,
        user_screen_name: tweet.user.screen_name,
        content: tweet.text,
        tweeted_at: tweet.created_at,
        category: category
      }
    end
end
