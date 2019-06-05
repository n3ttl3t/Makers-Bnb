require_relative 'feature_method'

feature Makers_BnB do

  scenario 'lists all available spaces' do
    create_account
    login
    expect(current_path).to eq('/spaces')
    expect(page).to have_content('My beautiful Treehouse')
  end

  scenario 'has add a new space page' do
    create_account
    login
    expect(current_path).to eq('/spaces')
    click_button('add')
    expect(current_path).to eq('/spaces/new')
  end

  scenario 'has a form for adding a new space' do
    visit('/spaces/new')
    expect(page).to have_field('name')
    expect(page).to have_field('description')
    expect(page).to have_field('price')
    expect(page).to have_button('submit')
  end

  scenario 'it shows added space' do
    visit('/spaces/new')
    fill_in 'name', with: 'Skinner House'
    fill_in 'description', with: 'Aurora Borealis'
    fill_in 'price', with: '1'
    click_button 'submit'
    expect(current_path).to eq('/spaces')

    # expect(page).to have_content('Skinner House')
    # expect(page).to have_content('Aurora Borealis')
    # expect(page).to have_content('$1')
  end

end
