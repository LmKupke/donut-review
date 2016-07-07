require 'rails_helper'

feature "user signs In", %{
  As unauthenticated user
  I want to sign in
  So that I add donut and review the app.
} do
  # Acceptance Criteria
  # [ ] Link to sign in exists in the nav-bar
  # [ ] Clicking Sign in shows the sign-in form
  # [ ] Signing in directs us to donuts page

  scenario "user sees sign in" do
    visit root_path
    expect(page).to have_link("Sign In")
  end

  scenario "user sucessfully sign-in" do
    @user = create(:user)
    visit root_path
    click_link("Sign In")
    expect(page).to have_css("input#user_email")
    expect(page).to have_css("input#user_password")
    fill_in("Email", with: @user.email)
    fill_in("Password", with: @user.password)

    click_button("Log in")

    expect(page).to have_content("Signed in successfully.")
  end

  scenario "user enters wrong email and does not successfully sign-in" do
    @user = create(:user)
    visit root_path
    click_link("Sign In")
    expect(page).to have_css("input#user_email")
    expect(page).to have_css("input#user_password")
    fill_in("Email", with: "123@gmail.com")
    fill_in("Password", with: @user.password)

    click_button("Log in")

    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "user enters wrong password and does not successfully sign-in" do
    @user = create(:user)
    visit root_path
    click_link("Sign In")
    expect(page).to have_css("input#user_email")
    expect(page).to have_css("input#user_password")
    fill_in("Email", with: @user.email)
    fill_in("Password", with: "password")

    click_button("Log in")

    expect(page).to have_content("Invalid Email or password.")
  end
end
