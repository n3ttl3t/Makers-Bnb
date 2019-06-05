feature "Adding bookings" do
  scenario "alows the user to request a booking" do
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
    click_button("book")
    expect(current_path).to eq('/bookings/requests')
    expect(page).to have_content("Thank you for your request")
    click_button 'Return to spaces'
    expect(current_path).to eq('/spaces')
  end
end
