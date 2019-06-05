def create_account
  user = User.create(name: 'Roxana Smith', username: 'SaltyRox', email: 'roxxmoxx@gmail.com', password: 'roxurulez1234')
end

def login
  visit('/')
  fill_in('username', with: 'SaltyRox')
  fill_in('password', with: 'roxurulez1234')
  click_button('Login')
end

def new_space
    click_button('add')
    fill_in 'name', with: 'Skinner House'
    fill_in 'description', with: 'Aurora Borealis'
    fill_in 'price', with: '1'
    fill_in 'available_from', with: "5/6/2019"
    fill_in 'available_to', with: "10/6/2019"
    click_button 'submit'
end