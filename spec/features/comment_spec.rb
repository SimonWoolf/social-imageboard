require 'spec_helper'

describe 'comments' do
  specify 'adding a comment to a post' do
    create(:post)
    visit '/posts'
    click_link 'posttitle'
    click_link 'Add comment'
    fill_in 'comment_name', with: 'test name'
    fill_in 'comment_text', with: 'test comment'
    click_button 'Create Comment'
    expect(page).to have_content 'posttitle'
    expect(page).to have_content 'test name'
    expect(page).to have_content 'test comment'
  end
end
