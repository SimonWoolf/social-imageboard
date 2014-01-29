require 'spec_helper'

describe 'posts' do
  it 'should show posts on the index page' do
    create(:post)
    visit '/posts'
    expect(page).to have_content 'posttitle'
    expect(page).to have_content 'postbody'
    expect(page).not_to have_content 'Error'
  end

  describe 'logged in' do
    before :each do
      @user = create(:user)
      login_as(@user)
    end

    it 'should create a new post' do
      visit '/posts/new'
      fill_in 'post_title', with: 'testtitle'
      fill_in 'post_body', with: 'testbody'
      fill_in 'post_link', with: 'google.co.uk'
      fill_in 'post_tagstring', with: 'testing, feature'
      click_button 'Create Post'
      expect(page).to have_link 'testtitle', href: 'http://google.co.uk'
      expect(page).to have_content 'testbody'
      expect(page).to have_content '#testing'
      expect(page).to have_content '#feature'
      expect(page).to have_content 'edit'
    end

    it 'should show an uploaded image', slow: true do
      visit '/posts/new'
      fill_in 'post_title', with: 'testtitle'
      attach_file 'post_image', Rails.root.join('spec/images/testimage.jpg')
      click_button 'Create Post'
      expect(page).to have_css 'img.post-image'
    end

    it 'should delete posts' do
      create(:post, user: @user)
      visit '/posts'
      click_link 'delete'
      expect(page).not_to have_content 'posttitle'
      expect(page).not_to have_content 'Error'
    end

    it 'should edit posts' do
      create(:post, user: @user)
      visit '/posts'
      click_link 'edit'
      fill_in 'post_title', with: 'newtitle'
      fill_in 'post_body', with: 'newbody'
      click_button 'Update Post'
      expect(page).to have_content 'newtitle'
      expect(page).not_to have_content 'testtitle'
    end

    context 'post made by another user' do
      specify 'should not be able to edit/delete' do
        creator = create(:user, email: 'creator@example.com')
        post = create(:post)
        creator.posts << post
        visit '/posts'
        expect(page).not_to have_link 'edit'
      end
    end
  end
end
