require 'spec_helper'

before :each do
  @user = create(:user)
end

describe 'Articles' do
  specify 'Adding a new article' do
    login_as(@user)
    visit '/articles/new'
    fill_in 'article_title', with: 'Google search engine'
    fill_in 'article_link', with: 'http://google.co.uk'
    fill_in 'article_text', with: 'Searches for things'
    click_button 'Create Article'
    expect(page).to have_content 'testtitle'
    expect(page).to have_content 'Searches for things'
    expect(page).to have_link 'Google search engine', href: 'http://google.co.uk'
  end
end
