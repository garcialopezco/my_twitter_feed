require "rails_helper"

RSpec.describe TweetsImporter do
  let(:categories) {
    [
      "healthcare",
      "nasa",
      "open source"
    ]
  }

  describe "initializing" do
    it "sets categories" do
      importer = TweetsImporter.new(categories: categories)
      expect(importer.categories).to match_array categories
    end
  end # describe

  describe "#import!" do
    context "when categories are provided" do
      let(:healthcare_tweets) {
        JSON.parse(file_fixture("healthcare.json").read, symbolize_names: true)
      }

      let(:nasa_tweets) {
        JSON.parse(file_fixture("nasa.json").read, symbolize_names: true)
      }

      let(:open_source_tweets) {
        JSON.parse(file_fixture("open_source.json").read, symbolize_names: true)
      }

      before :each do
        allow_any_instance_of(TweetsLookup).to receive(:search).with("healthcare").and_return(healthcare_tweets)
        allow_any_instance_of(TweetsLookup).to receive(:search).with("nasa").and_return(nasa_tweets)
        allow_any_instance_of(TweetsLookup).to receive(:search).with("open source").and_return(open_source_tweets)
      end

      it "creates new tweets records per category" do
        importer = TweetsImporter.new(categories: categories)

        expect {
          importer.import!
        }.to change { Tweet.count }.by(30)

        expect(Tweet.where(category: "healthcare").count).to eq 10
        expect(Tweet.where(category: "nasa").count).to eq 10
        expect(Tweet.where(category: "open source").count).to eq 10
      end
    end # context when categories are provided
  end # describe import!
end # describe
