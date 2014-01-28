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

    it "should not be able to delete" do
      delete 'destroy', id: @post
      expect(response).to redirect_to new_user_session_path
    end
  end 
  
  context "logged in as right user" do
    before do
      user = create(:user)
      @post = create(:post)
      user.posts << @post
      sign_in(user)
    end

    it "should be able to update" do
      put 'update', id: @post, post: attributes_for(:post)
      expect(response).to redirect_to @post # = post_path(post)
    end

    it "should be able to delete" do
      delete 'destroy', id: @post, post: attributes_for(:post)
      expect(response).to redirect_to posts_path 
    end
  end 

  context "logged in as wrong user" do
    before do
      creator = create(:user, email: 'creator@example.com')
      @post = create(:post)
      creator.posts << @post

      user = create(:user)
      sign_in(user)
    end

    it "should not be able to update" do
      put 'update', id: @post, post: attributes_for(:post)
      expect(response).to_not redirect_to @post
    end

    it "should be able to delete" do
      delete 'destroy', id: @post, post: attributes_for(:post)
      pp response
      # note: same response as if it doesn't delete...
      expect(response).to redirect_to posts_path 
    end
  end 
end
