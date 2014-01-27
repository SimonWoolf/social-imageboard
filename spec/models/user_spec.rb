require 'spec_helper'

describe User do
  it 'should know what articles it\'s upvoted' do
    creator = create(:user)
    upvoter = create(:user, email: "another@example.com")
    article = create(:article)
    creator.articles << article
    upvoter.upvote(article)
    expect(upvoter.upvoted.first).to eq article
  end
end
