def setup_environment
  User.create(name: 'Roxana Smith', username: 'SaltyRox', email: 'roxxmoxx@gmail.com', password: 'roxurulez1234')
  User.create(name: 'Cosmin', username: 'Cosmin', email: 'cosmin@cosmin.com', password: '1234')

  visit('/')
  fill_in('username', with: 'SaltyRox')
  fill_in('password', with: 'roxurulez1234')
  click_button('Login')

  click_button('Add Space')
  fill_in 'name', with: "Salty House"
  fill_in 'description', with: 'Big'
  fill_in 'price', with: '1'
  fill_in 'available_from', with: "5/6/2019"
  fill_in 'available_to', with: "10/6/2019"
  click_button 'submit'

  visit('/')
  fill_in('username', with: 'Cosmin')
  fill_in('password', with: '1234')
  click_button('Login')

  click_button('Add Space')
  fill_in 'name', with: 'Cosmin House'
  fill_in 'description', with: 'Small'
  fill_in 'price', with: '3'
  fill_in 'available_from', with: "5/6/2219"
  fill_in 'available_to', with: "10/6/2319"
  click_button 'submit'
end

def create_account
  user = User.create(name: 'Roxana Smith', username: 'SaltyRox', email: 'roxxmoxx@gmail.com', password: 'roxurulez1234')
end

def create_account_alt
  user = User.create(name: 'Roxana Pirvu', username: 'Rox', email: 'rox@gmail.com', password: 'rox')
end

def login
  visit('/')
  fill_in('username', with: 'SaltyRox')
  fill_in('password', with: 'roxurulez1234')
  click_button('Login')
end

def login_alt
  visit('/')
  fill_in('username', with: 'Rox')
  fill_in('password', with: 'rox')
  click_button('Login')
end

def new_space
  click_button('Add Space')
  fill_in 'name', with: 'Skinner House'
  fill_in 'description', with: 'Aurora Borealis'
  fill_in 'price', with: '1'
  fill_in 'available_from', with: "5/6/2019"
  fill_in 'available_to', with: "10/6/2019"
  click_button 'submit'
end

def new_space_alt
  click_button('Add Space')
  fill_in 'name', with: 'Your House'
  fill_in 'description', with: 'Super'
  fill_in 'price', with: 'free'
  fill_in 'available_from', with: "5/6/2219"
  fill_in 'available_to', with: "10/6/2319"
  click_button 'submit'
end
