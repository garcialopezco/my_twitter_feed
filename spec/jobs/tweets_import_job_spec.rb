require 'rails_helper'

RSpec.describe TweetsImportJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later }

  it "adds the job to the queue" do
    expect {
      job
    }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it "calls service to import tweets" do
    importer = double "TweetsImporter", import!: nil
    allow(TweetsImporter).to receive(:new).and_return importer
    config = {
      categories: ["healthcare", "nasa", "open source"],
      strategy:   "recent",
      count:      10
    }

    perform_enqueued_jobs { job }

    expect(TweetsImporter).to have_received(:new).with(config).once
    expect(importer).to have_received(:import!).once
  end
end
