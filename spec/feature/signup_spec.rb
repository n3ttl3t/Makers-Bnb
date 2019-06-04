require 'spec_helper'

feature 'signing up' do
  scenario "it allows a new user to sign up" do
    visit('/')
    fill_in('name', with: 'Mo Salah')
    fill_in('username', with: 'mosalah10')
    fill_in('email', with: 'mo.salah@gmail.com')
    fill_in('password', with: 'password')
    click_button('Submit')
    expect(page).to have_content("works")
  end
end
