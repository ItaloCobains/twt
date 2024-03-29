require 'rails_helper'

RSpec.describe TweetPresenter, type: :presenter do
  describe '#created_at' do
    context "when 24 hours have passed" do
      before do
        Timecop.freeze(Time.local(2008, 9, 3, 10, 5, 0))
      end

      after do
        Timecop.return
      end
      it "displays the shortend date format" do
        tweet = create(:tweet)
        tweet.update! created_at: 2.days.ago
        expect(TweetPresenter.new(tweet: tweet, current_user: build_stubbed(:user)).created_at).to eq("Sep 01")
      end
    end

    context "only a few hours have passed" do
      it "displays how many hours have past" do
        tweet = create(:tweet)
        tweet.update! created_at: 2.hours.ago
        expect(TweetPresenter.new(tweet: tweet, current_user: build_stubbed(:user)).created_at).to eq("about 2 hours")
      end
    end
  end
end
