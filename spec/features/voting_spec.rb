require 'spec_helper'

describe 'Voting' do
  before :each do
    @user = create(:user)
    login_as(@user)
  end

  specify 'upvoting a post' do
    @user.posts << create(:post)
    visit '/posts'
    click_button '↑'
    expect(page).to have_css '.upvotes', text: '1'
  end
  
  specify 'un-upvoting an post' do
    @user.posts << create(:post)
    visit '/posts'
    click_button '↑'
    click_button '↑'
    expect(page).to have_css '.upvotes', text: '0'
  end
end
