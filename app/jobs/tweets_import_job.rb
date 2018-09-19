class TweetsImportJob < ApplicationJob
  queue_as :default

  def perform
    tweets_importer.import!
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
end
