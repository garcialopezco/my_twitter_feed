FactoryBot.define do
  factory :tweet do
    user_name { "some_user_name" }
    user_screen_name { "Some User" }
    content { "Some content for the tweet" }
    tweeted_at { Time.current }
  end
end
