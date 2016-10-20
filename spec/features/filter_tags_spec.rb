# require 'spec_helper.rb'
#
# feature 'filter tags' do
#   scenario 'allows user to filter links by tags' do
#     visit '/links/new'
#     fill_in 'url', with: "www.makersacademy.com"
#     fill_in 'title', with: "Makers Academy"
#     fill_in 'tags', with: 'bubbles'
#     click_button 'Submit'
#     fill_in 'name', with: 'bubbles'
#     click_button 'Filter'
#     link = Link.create({url: "www.makersacademy.com", title: 'Makers Academy'})
#     tag = Tag.first_or_create({name: "bubbles"})
#     link.tags << tag
#     link.save
#     expect(link.tags.map(&:name)).to include('bubbles')
#   end
# end
