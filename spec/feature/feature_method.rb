def create_account
  user = User.create(name: 'Roxana Smith', username: 'SaltyRox', email: 'roxxmoxx@gmail.com', password: 'roxurulez1234')
end

def login
  visit('/')
  fill_in('username', with: 'SaltyRox')
  fill_in('password', with: 'roxurulez1234')
  click_button('Login')
end