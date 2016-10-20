require 'spec_helper.rb'

feature 'prints links' do
  before(:each) do
  Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
  Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
  Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
  Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'prints list of links on homepage' do
    visit '/links'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Makers Academy')
  end

    scenario 'allows user to filter links by tags' do
      visit '/links'
      fill_in('name', :with => "bubbles")
      click_button 'Filter'
      #  expect(page.status_code).to eq(200)
       expect(page).not_to have_content('Makers Academy')
       expect(page).not_to have_content('Code.org')
       expect(page).to have_content('This is Zombocom')
       expect(page).to have_content('Bubble Bobble')
  end

  # scenario 'allow user to filter links by multiple tag' do
  #   visit '/links'
  #   fill_in('name', :with => "bubbles")
  #   click_button 'Filter'
  #   fill_in('name', :with => "search")
  #   click_button 'Filter'
  #   expect(page.status_code).to eq(200)
  #    expect(page).not_to have_content('Makers Academy')
  #    expect(page).not_to have_content('Code.org')
  #    expect(page).to have_content('Google')
  #    expect(page).to have_content('This is Zombocom')
  #    expect(page).to have_content('Bubble Bobble')
  # end

end
