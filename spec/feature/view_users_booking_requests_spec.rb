feature "viewing users bookings" do
  scenario "it only shows booking requests that belong to the user" do
    setup_environment
    expect(current_path).to eq('/spaces')
    click_button "book Salty House"

    login
    click_button "Review"
    expect(page).not_to have_content("Cosmin House")
    expect(page).to have_content("Salty House")
  end
end
