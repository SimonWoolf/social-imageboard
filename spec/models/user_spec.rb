require 'spec_helper'

describe User do
  describe '#upvote & .upvoted' do
    before :each do
      creator = create(:user)
      @post = create(:post)
      creator.posts << @post
      @upvoter = create(:user, email: "another@example.com")
    end

    it 'should upvote if not upvoted' do
      @upvoter.upvote(@post)
      expect(@upvoter.upvoted.first).to eq @post
    end

    it 'should un-upvote if upvoted again' do
      @upvoter.upvote(@post)
      @upvoter.upvote(@post)
      expect(@upvoter.upvoted).to be_empty
    end
  end
end
