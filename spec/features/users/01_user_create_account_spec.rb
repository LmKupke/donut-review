require 'rails_helper'

feature "user creates an account", %{
  As a first-time unauthenticated user
  I want to sign up
  So that I can use the rest of the features.
} do
  # Acceptance Criteria
  # [X] Link to sign up exists in the nav-bar when not logged in
  # [X] Sign-up page has a form
  # [X] Form returns error when required fields are not entered correctly
  # [X] Displays success message when form is submitted correctly
  context "as a prospective user" do
    before(:each) do
      visit root_path
      click_link("Sign Up")
    end

    scenario "I can visit the root path and click a link to create a new
      account" do
      expect(page).to have_css("form#new_user")
    end

    scenario "I can click a link to create a new account and is taken to the
      new user form" do
      expect(page).to have_css("input#user_first_name")
      expect(page).to have_css("input#user_last_name")
      expect(page).to have_css("input#user_email")
      expect(page).to have_css("input#user_password")
      expect(page).to have_css("input#user_password_confirmation")
    end

    scenario "I will successfully create an account by filling out the form
      correctly" do
      fill_in("First Name", with: "John")
      fill_in("Last Name", with: "Smith")
      fill_in("Email", with: "abc@gmail.com")
      fill_in("Password", with: "password")
      fill_in("Password Confirmation", with: "password")
      click_button('Sign Up')

      expect(page).to have_content("Welcome! You have signed up successfully.")
    end

    scenario "using an invalid email address to create a new account will
      re-render the page with an error message" do
      fill_in("First Name", with: "John")
      fill_in("Last Name", with: "Smith")
      fill_in("Email", with: "abc@gmai")
      fill_in("Password", with: "password")
      fill_in("Password Confirmation", with: "password")

      click_button('Sign Up')

      expect(page).to have_content("Sign up")
      expect(page).to have_content("Email is invalid")
    end
  end
end
