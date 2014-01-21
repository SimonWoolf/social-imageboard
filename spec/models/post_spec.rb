require 'spec_helper'

describe Post do
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
end
