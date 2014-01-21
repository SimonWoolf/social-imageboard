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
end
