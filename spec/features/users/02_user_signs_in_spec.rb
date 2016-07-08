require 'rails_helper'

feature "user signs In", %{
  As unauthenticated user
  I want to sign in
  So that I add donut and review the app.
} do
  # Acceptance Criteria
  # [X] Link to sign in exists in the nav-bar
  # [X] Clicking Sign in shows the sign-in form
  # [X] Signing in directs us to donuts page
  # [X] Entering invalid email or password does not allow log in
  # [X] Entering invalid email or password renders an error message

  before(:each) do
    visit root_path
    click_link("Sign In")
  end

  context "As an unauthenticated user" do
    let(:user) { create(:user) }

    scenario "I will successfully sign in with valid credentials" do
      fill_in("Email", with: user.email)
      fill_in("Password", with: user.password)

      click_button("Log in")

      expect(page).to have_content("Signed in successfully.")
    end

    scenario "I will not successfully sign-in if I enter an invalid email" do
      fill_in("Email", with: "123gmail.com")
      fill_in("Password", with: user.password)

      click_button("Log in")

      expect(page).to have_content("Invalid Email or password.")
    end

    scenario "I will not successfully sign-in if I enter an invalid
      password" do
      fill_in("Email", with: user.email)
      fill_in("Password", with: "password")

      click_button("Log in")

      expect(page).to have_content("Invalid Email or password.")
    end
  end
end
