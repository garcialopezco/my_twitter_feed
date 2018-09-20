class TweetsImportJob < ApplicationJob
  queue_as :default

  def perform
    tweets_importer.import!
    enqueue_for_later
  end

  private

    def tweets_importer
      @tweets_importer ||= TweetsImporter.new(import_config)
    end

    def import_config
      {
        categories: Rails.configuration.x.categories_for_tweets,
        strategy:   Rails.configuration.x.tweets_search_strategy,
        count:      Rails.configuration.x.number_of_tweets_to_import
      }
    end

    def enqueue_for_later
      TweetsImportJob.set(wait: 5.minutes).perform_later
    end
end
