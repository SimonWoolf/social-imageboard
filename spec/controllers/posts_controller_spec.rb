require 'spec_helper'

describe PostsController do
  context "not signed in" do
    before do
      creator = create(:user, email: 'creator@example.com')
      @post = create(:post)
      creator.posts << @post
    end

    it "should not be able to update" do
      put 'update', id: @post, post: attributes_for(:post)
      expect(response).to redirect_to new_user_session_path
    end
  end 
  
  context "logged in as right user" do
    it "should be able to update" do

      user = create(:user)
      post = create(:post)
      user.posts << post

      sign_in(user)

      put 'update', id: post, post: attributes_for(:post)
      pp response
      expect(response).to redirect_to post # = post_path(post)
    end
  end 

  context "logged in as wrong user" do
    it "should not be able to update/delete" do
      creator = create(:user, email: 'creator@example.com')
      post = create(:post)
      creator.posts << post

      user = create(:user)
      sign_in(user)

      put 'update', id: post, post: attributes_for(:post)
      expect(response).to_not redirect_to post
    end
  end 
end
