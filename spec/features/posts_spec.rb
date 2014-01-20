require 'spec_helper'

describe 'posts' do
  it 'should show posts on the index page' do
    create(:post)
    visit '/posts'
    expect(page).to have_content 'posttitle'
    expect(page).to have_content 'postbody'
    expect(page).not_to have_content 'Error'
  end

  it 'should create a new post' do
    visit '/posts/new'
    fill_in 'post_title', with: 'testtitle'
    fill_in 'post_body', with: 'testbody'
    click_button 'Create Post'
    expect(page).to have_content 'testtitle'
    expect(page).to have_content 'testbody'
  end

  it 'should show an uploaded image' do
    visit '/posts/new'
    fill_in 'post_title', with: 'testtitle'
    attach_file 'image', Rails.root.join('spec/images/testimage.jpg')
    click_button 'Create Post'
    expect(page).to have_css 'img.post-image'
  end
end
