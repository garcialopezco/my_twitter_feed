require "rails_helper"

RSpec.describe "Tweets API", type: :request do
  describe "GET /tweets" do
    let!(:tweets) { create_list :tweet, 10 }

    before { get "/tweets" }

    it "returns tweets" do
      expect(json).not_to be_empty
      expect(json.size).to eq 10
    end

    it "responses with status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  def json
    JSON.parse(response.body)
  end
end
