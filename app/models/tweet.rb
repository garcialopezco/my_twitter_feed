class Tweet < ApplicationRecord
  validates :user_name, presence: true
  validates :user_screen_name, presence: true
  validates :content, presence: true
  validates :tweeted_at, presence: true
end
