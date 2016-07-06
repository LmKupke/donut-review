require 'rails_helper'

feature "user create account", %Q{
  As a first-time unauthenticated user
  I want to sign up
  So that I can use the rest of the features.
} do
  #Acceptance Criteria
  # [ ] Link to sign up exists in the nav-bar when not logged in
  # [ ] Sign-up page has a form
  # [ ] Form returns error when required fields are not entered correctly
  # [ ] Displays success message and redirects to user profile when form is submitted correctly

  scenario 'user sees sign-up link' do
    visit root_path
    expect(page).to have_link("Sign Up")
  end

  scenario 'user clicks sign up link' do
    visit root_path
    click_link("Sign Up")
    expect(page).to have_css('form')
  end
end
