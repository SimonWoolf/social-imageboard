require 'spec_helper'

describe 'Articles' do
  before :each do
    @user = create(:user)
    login_as(@user)
  end

  specify 'Adding a new article' do
    visit '/articles/new'
    fill_in 'article_title', with: 'Google search engine'
    fill_in 'article_link', with: 'http://google.co.uk'
    fill_in 'article_text', with: 'Searches for things'
    click_button 'Create Article'
    expect(page).to have_link 'Google search engine', href: 'http://google.co.uk'
    expect(page).to have_content 'Searches for things'
  end

  specify 'upvoting an article' do
    @user.articles << create(:article)
    visit '/articles'
    click_button '↑'
    expect(page).to have_css '.upvotes', text: '1'
  end
  
  specify 'un-upvoting an article' do
    @user.articles << create(:article)
    visit '/articles'
    click_button '↑'
    click_button '↑'
    expect(page).to have_css '.upvotes', text: '0'
  end
end
