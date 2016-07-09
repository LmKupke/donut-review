require "rails_helper"

feature "user signs out", %{
  As an authenticated user
  I want to sign out
  So that I can leave the app.
} do
  # Acceptance Criteria
  # [X] Link to sign out exists in the nav-bar when logged in
  # [X] Clicking Sign Out show message you have signed out
  # [X] Link to Sign In appears after signing out
  scenario "An authenticated user is able to sign out"  do
    user = create(:user)
    login_as(user)
    visit root_path
    click_link("Sign Out")

    expect(page).to have_content("Signed out successfully")
    expect(page).to have_link("Sign In")
  end
end
