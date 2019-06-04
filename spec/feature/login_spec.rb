
feature 'logging in' do
  scenario "it allows an existing user to log in" do
    user = User.create(name: 'Roxana Smith', username: 'SaltyRox', email: 'roxxmoxx@gmail.com', password: 'roxurulez1234')

    visit('/')
    fill_in('username', with: 'SaltyRox')
    fill_in('password', with: 'roxurulez1234')
    click_button('Login')
    expect(current_path).to eq('/spaces')
  end
end
