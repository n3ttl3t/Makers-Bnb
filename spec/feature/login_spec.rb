
feature 'logging in' do
  scenario "it allows an existing user to log in" do
    user = User.create(name: 'Roxana Smith', username: 'SaltyRox', email: 'roxxmoxx@gmail.com', password: 'roxurulez1234')

    visit('/')
    fill_in('username', with: 'SaltyRox')
    fill_in('password', with: 'roxurulez1234')
    click_button('Login')
    expect(current_path).to eq('/spaces')
    expect(page).to have_content 'Welcome SaltyRox'
  end

  scenario "it throws a flash error if the username and password are incorrect" do
    user = User.create(name: 'Roxana Smith', username: 'SaltyRox', email: 'roxxmoxx@gmail.com', password: 'roxurulez1234')

    visit('/')
    fill_in('username', with: 'SaltyRox')
    fill_in('password', with: 'wrong_pass')
    click_button('Login')
    expect(page).to have_content 'The username and password that you entered did not match our records. Please double-check and try again.'
  end
end
