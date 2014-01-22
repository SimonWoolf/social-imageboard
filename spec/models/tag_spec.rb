require 'spec_helper'

describe Tag do
  it 'should normalise names which are created directly' do
    tag = Tag.create(name: '*&TAgteST')
    expect(tag.name).to eq 'tagtest'
  end
end
