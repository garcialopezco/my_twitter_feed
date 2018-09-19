class TweetsLookup
  attr_reader :client

  def initialize(strategy: "recent", count: 10)
    @client   = TweetsLookup.api
    @strategy = strategy
    @count    = count
  end

  def search(term)
    results = client.search("#{term} -rt", result_type: @strategy, count: @count)
    results.to_h[:statuses]
  rescue Twitter::Error::Unauthorized => e
    []
  end

  def self.api
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN__SECRET']
    end
  end
end
