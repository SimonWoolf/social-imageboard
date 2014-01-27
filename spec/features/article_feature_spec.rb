require 'spec_helper'


describe 'Articles' do
  before :each do
    @user = create(:user)
  end

  specify 'Adding a new article' do
    login_as(@user)
    visit '/articles/new'
    fill_in 'article_title', with: 'Google search engine'
    fill_in 'article_link', with: 'http://google.co.uk'
    fill_in 'article_text', with: 'Searches for things'
    click_button 'Create Article'
    expect(page).to have_link 'Google search engine', href: 'http://google.co.uk'
    expect(page).to have_content 'Searches for things'
  end

  specify 'upvoting an article' do
    create(:article_user)
    visit '/articles'
    click_button 'upvote'
    expect(page).to have_css 'upvotes', text: '1'
  end
end
