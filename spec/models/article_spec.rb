require 'spec_helper'

describe Article do
  it 'should know what user created it' do
    user = create(:user)
    article = create(:article)
    user.articles << article
    expect(article.creator).to be user
    
  end

  it 'should know what users have upvoted it' do
    creator = create(:user)
    upvoter = create(:user, email: "another@example.com")
    article = create(:article)
    creator.articles << article
    upvoter.upvote(article)
    expect(article.upvoters.first).to eq upvoter
  end

  it 'should only be upvotable once per user' do
    creator = create(:user)
    upvoter = create(:user, email: "another@example.com")
    article = create(:article)
    creator.articles << article
    upvoter.upvote(article)
    expect{upvoter.upvote(article)}.to raise_error
    expect(article.upvotes.count).to eq 1
  end
end
