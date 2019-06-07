feature "it has a logout feature" do
  scenario "it allows the user to logout after logging in" do
    create_account
    login
    expect(current_path).to eq('/spaces')
    click_button("Logout")
    expect(current_path).to eq('/')
  end
end
