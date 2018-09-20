require "rails_helper"

RSpec.describe "Tweets API", type: :request do
  describe "GET /tweets" do
    let!(:tweets) { create_list :tweet, 20 }

    before { get "/tweets" }

    it "returns tweets" do
      expect(json).not_to be_empty
      expect(json.size).to eq 15
    end

    it "responses with status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /tweets?category=Cat1" do
    let!(:tweets) do
      create :tweet, category: "Cat1", content: "First", tweeted_at: Time.current - 1.minute
      create :tweet, category: "Cat1", content: "Last", tweeted_at: Time.current - 5.minutes
      create_list :tweet, 3, category: "Cat1", tweeted_at: Time.current - 3.minutes
      create_list :tweet, 5, category: "Another Category", tweeted_at: Time.current - 2.minutes
    end

    before { get "/tweets?category=Cat1" }

    it "returns tweets" do
      expect(json).not_to be_empty
      expect(json.size).to eq 5
    end

    it "responses with status code 200" do
      expect(response).to have_http_status(200)
    end

    it "returns tweets ordered by tweeted_at attribute, most recent first" do
      expect(json.first["content"]).to eq "First"
      expect(json.last["content"]).to eq "Last"
    end
  end # describe

  def json
    JSON.parse(response.body)
  end
end
