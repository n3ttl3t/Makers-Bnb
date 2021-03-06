require 'data_mapper'
require 'dm-postgres-adapter'

#require 'spec_helper'

feature 'signing up' do
  scenario "it allows a new user to sign up" do
    visit('/')
    click_button('SignUp')
    expect(current_path).to eq('/signup')
    fill_in('name', with: 'Mo Salah')
    fill_in('username', with: 'mosalah10')
    fill_in('email', with: 'mo.salah@gmail.com')
    fill_in('password', with: 'password')
    click_button('Register')
    expect(current_path).to eq('/spaces')
  end
end
