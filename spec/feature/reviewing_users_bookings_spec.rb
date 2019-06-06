feature "reviewing own booking" do
  scenario "it only shows requests made on that users space" do
    setup_environment
    click_button "book Salty House"
    visit('/spaces')
    click_button "Review"
    expect(page).not_to have_content("Salty House")
  end
end
