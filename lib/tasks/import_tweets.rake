desc "This task is intended for being called by some scheduler so the tweets import could be performed every amount of time"
task import_tweets: :environment do
  puts "Importing tweets"
  TweetsImportJob.perform_later
end
