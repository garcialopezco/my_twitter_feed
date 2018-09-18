require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it { is_expected.to validate_presence_of :user_name }
  it { is_expected.to validate_presence_of :user_screen_name }
  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_presence_of :tweeted_at }
end
