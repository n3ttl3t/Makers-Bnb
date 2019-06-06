feature "confirming booking" do
  scenario "user can confirm a booking request" do
    create_account
    login
    new_space
    expect(current_path).to eq('/spaces')
    click_button("book Skinner House")
    expect(current_path).to eq('/bookings/requests')
    expect(page).to have_content("Thank you for your request")
    click_button 'Return to spaces'
    expect(current_path).to eq('/spaces')
    click_button 'Review'
    expect(current_path).to eq('/bookings/review')
    expect(page).to have_content("Skinner House")
    click_button 'Confirm Skinner House booking'
    expect(page).to have_content("You have confirmed the request")
  end
end
