require 'spec_helper'

describe Post do
  it 'should know what user created it' do
    user = create(:user)
    post = create(:post)
    user.posts << post
    expect(post.creator).to be user
  end

  it 'should know what users have upvoted it' do
    creator = create(:user)
    upvoter = create(:user, email: "another@example.com")
    post = create(:post)
    creator.posts << post
    upvoter.upvote(post)
    expect(post.upvoters.first).to eq upvoter
  end

  describe '#tagstring=' do
    it 'should create a tag attached to the post' do
      post = create(:post, tagstring: 'atag')
      expect(post.tags.first.name).to eq 'atag'
      expect(Tag.first.posts.first.title).to eq 'posttitle'
    end

    it 'should use existing tags' do
      create(:post, tagstring: 'atag, btag')
      create(:post, tagstring: 'ctag, btag')
      expect(Tag.count).to eq 3
    end

    it 'should treat uppercase and lowercase tags as equivalent' do
      create(:post, tagstring: 'atag')
      create(:post, tagstring: 'aTaG')
      expect(Tag.count).to eq 1
    end

    it 'should deal with either comma or (multiple) space separated tagstrings' do
      create(:post, tagstring: "atag, ,,,,  btag\t \t ctag,d_tag")
      expect(Tag.all.map(&:name)).to eq ["atag", "btag", "ctag", "d_tag"]
    end
  end

  describe '#link=' do
    it 'should pass a full url untouched' do 
      post = create(:post, link: 'http://example.com')
      expect(post.link).to eq 'http://example.com'
    end

    it 'should store a link without protocol as http://' do 
      post = create(:post, link: 'example.com')
      expect(post.link).to eq 'http://example.com'
    end

    it 'should store a link without protocol as http://' do 
      post = create(:post, link: 'example.com')
      expect(post.link).to eq 'http://example.com'
    end

    it 'should not store an invalid url' do
      expect{create(:post, link: '£$%&@€')}.to raise_error URI::InvalidURIError
    end
  end
end
