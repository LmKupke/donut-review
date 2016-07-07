require 'rails_helper'

feature "user signs out", %{
  As an authenticated user
  I want to sign out
  So that I can leave the app.
} do
  # Acceptance Criteria
  # [ ] Link to sign out exists in the nav-bar when logged in
  # [ ] Clicking Sign Out show message you have signed out
  # [ ] Link to Sign In appears after signing out
  scenario "user sees sign in and sign up links" do
    visit root_path
    expect(page).to have_link("Sign In")
    expect(page).to have_link("Sign Up")
  end

  scenario "user signs in" do
    @user = create(:user)
    login_as(@user)
    visit root_path
    expect(page).to have_link("Sign Out")
  end
end
