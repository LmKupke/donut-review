require 'rails_helper'

feature "user create account", %{
  As a first-time unauthenticated user
  I want to sign up
  So that I can use the rest of the features.
} do
  # Acceptance Criteria
  # [ ] Link to sign up exists in the nav-bar when not logged in
  # [ ] Sign-up page has a form
  # [ ] Form returns error when required fields are not entered correctly
  # [ ] Displays success message and redirects to user profile when form
  #     is submitted correctly

  scenario 'user sees sign-up registration Title' do
    visit root_path
    click_link("Sign Up")

    expect(page).to have_content("Sign up")
  end

  scenario 'user sees sign-up form' do
    visit root_path
    click_link("Sign Up")

    expect(page).to have_css("form#new_user")
  end

  scenario 'user sees all inputs form' do
    visit root_path
    click_link("Sign Up")
    expect(page).to have_css("input#user_first_name")
    expect(page).to have_css("input#user_last_name")
    expect(page).to have_css("input#user_email")
    expect(page).to have_css("input#user_password")
    expect(page).to have_css("input#user_password_confirmation")
  end

  scenario "user fills in form correctly" do
    visit root_path
    click_link("Sign Up")

    fill_in("First Name", with: "John")
    fill_in("Last Name", with: "Smith")
    fill_in("Email", with: "abc@gmail.com")
    fill_in("Password", with: "password")
    fill_in("Password Confirmation", with: "password")
    click_button('Sign Up')

    expect(page).to have_content("You have successfully signed up!")
  end

  scenario "user fills in form correctly" do
    visit root_path
    click_link("Sign Up")

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
