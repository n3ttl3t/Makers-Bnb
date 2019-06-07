require_relative 'feature_method'


feature 'Makers_BnB' do


  scenario 'has add a new space page' do
    create_account
    login
    expect(current_path).to eq('/spaces')
    click_button('add')
    expect(current_path).to eq('/spaces/new')
  end

  scenario 'has a form for adding a new space' do
    create_account
    login
    click_button('add')
    expect(page).to have_field('name')
    expect(page).to have_field('description')
    expect(page).to have_field('price')
    expect(page).to have_button('submit')
  end

  scenario 'it shows added space' do
    create_account
    login
    click_button('add')
    fill_in 'name', with: 'Skinner House'
    fill_in 'description', with: 'Aurora Borealis'
    fill_in 'price', with: '1'
    fill_in 'available_from', with: "5/6/2019"
    fill_in 'available_to', with: "10/6/2019"
    click_button 'submit'
    expect(current_path).to eq('/spaces')
    expect(page).to have_content('Skinner House')
    expect(page).to have_content('Aurora Borealis')
    expect(page).to have_content('1')
    expect(page).to have_content('2019-06-05')
    expect(page).to have_content('2019-06-10')
  end

  scenario 'it trys to add a space with incorrect date' do
    create_account
    login
    click_button('add')
    fill_in 'name', with: 'Skinner House'
    fill_in 'description', with: 'Aurora Borealis'
    fill_in 'price', with: '1'
    fill_in 'available_from', with: "Incorrect"
    fill_in 'available_to', with: "Wrong input"
    click_button 'submit'
    expect(page).to have_content('You entered an invalid date format. Please try again.')
    expect(current_path).to eq('/spaces/new')
  end

end
