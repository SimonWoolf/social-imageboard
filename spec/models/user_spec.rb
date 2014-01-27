require 'spec_helper'

describe User do
  describe '#upvote & .upvoted' do
    before :each do
      creator = create(:user)
      @article = create(:article)
      creator.articles << @article
      @upvoter = create(:user, email: "another@example.com")
    end

    it 'should upvote if not upvoted' do
      @upvoter.upvote(@article)
      expect(@upvoter.upvoted.first).to eq @article
    end

    it 'should un-upvote if upvoted again' do
      @upvoter.upvote(@article)
      @upvoter.upvote(@article)
      expect(@upvoter.upvoted).to be_empty
    end
  end
end
