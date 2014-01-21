require 'spec_helper'


describe 'filtering', js: true do
  it 'should filter in js if possible' do
    create(:post, title: 'goodpost', tagstring: 'goodtag')
    create(:post, title: 'badpost', tagstring: 'badtag')
    visit '/'
    fill_in 'tagfilter', with: 'goodtag'
    expect(page).to have_content(:visible, 'goodpost')
    expect(page).not_to have_content(:visible, 'badpost')
  end
  
  it 'should filter by multiple tags' do
    create(:post, title: 'goodpost', tagstring: 'goodtag requiredtag')
    create(:post, title: 'badpost 1', tagstring: 'goodtag')
    create(:post, title: 'badpost 2', tagstring: 'anothertag badtag')
    create(:post, title: 'badpost 3', tagstring: 'badtag')
    visit '/'
    fill_in 'tagfilter', with: 'requiredtag goodtag'
    expect(page).to have_content(:visible, 'goodpost')
    expect(page).not_to have_content(:visible, 'badpost')
  end

  it 'should perform a negative filter with a prepended dash' do
    create(:post, title: 'goodpost', tagstring: 'goodtag')
    create(:post, title: 'badpost', tagstring: 'badtag')
    visit '/'
    fill_in 'tagfilter', with: '-badtag'
    expect(page).to have_content(:visible, 'goodpost')
    expect(page).not_to have_content(:visible, 'badpost')
  end
end
