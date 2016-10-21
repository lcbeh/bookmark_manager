require 'spec_helper.rb'

feature 'homepage has a sign up form' do
  scenario 'user can sign up on homepage and is added to users' do
    visit '/'
    fill_in "email", with: "bob@aol.com"
    fill_in "password", with: "123"
    click_button "Sign Up"
    expect(User.first.email).to include("bob@aol.com")

  end
end

feature 'user is welcomed with their email on sign up' do
  scenario '/links displays a welcome message with email' do
    visit '/'
    fill_in "email", with: "bob@aol.com"
    fill_in "password", with: "123"
    click_button "Sign Up"
    expect(page).to have_content("Welcome, bob@aol.com")
  end
end

feature 'new user makes user count increase by 1' do
  scenario 'adding user increases length of table by 1' do
    visit '/'
    fill_in "email", with: "bob@aol.com"
    fill_in "password", with: "123"
    click_button "Sign Up"
    expect(User.count).to eq 1
  end
end
