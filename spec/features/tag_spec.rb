require 'spec_helper.rb'

feature 'tags links' do
  scenario 'organise links into categories with tags' do
    visit '/links/new'
    fill_in 'url', with: "www.makersacademy.com"
    fill_in 'title', with: "Makers Academy"
    fill_in 'tags', with: ('education school')
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'school')
  end



end
