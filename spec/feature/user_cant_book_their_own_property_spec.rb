require_relative 'feature_method'
feature "Unable to book own space" do
  scenario "raise a flash error if you try" do
    visit ("/")
    create_account
    login
    new_space
    click_button "book Skinner House"
    expect(page).to have_content("You can't book your own space!") # This was conflicting with other
  end
end
