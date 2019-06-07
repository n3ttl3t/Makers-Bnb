feature "Adding bookings" do
  scenario "alows the user to request a booking" do
    create_account
    login
    new_space
    new_space_alt
    expect(current_path).to eq('/spaces')
    click_button('Logout')
    create_account_alt
    login_alt
    click_button("book Your House")
    expect(current_path).to eq('/bookings/requests')
    expect(page).to have_content("Thank you for your request")
    click_button 'Return to spaces'
    expect(current_path).to eq('/spaces')
  end
end
