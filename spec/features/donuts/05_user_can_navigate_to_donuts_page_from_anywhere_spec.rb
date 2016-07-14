require "rails_helper"

feature "user can navigate to donuts index", %{
  As a user
  I want to be able to navigate to the donuts index from any page
  To look at delicious donuts
}, js: true do
  let!(:donut) { create(:donut) }
  let!(:user) { create(:user) }

  context "as an authenticated user" do
    scenario "I can navigate to the donuts index from an individual donut
      show page" do
      login_as(user)
      visit root_path
      click_link donut.name
      click_link "Home"

      expect(page).to have_content("Donut Judge Me")
      expect(page).to have_content(donut.name)
    end

    scenario "I can navigate to the donuts index from the add new donut
      page" do
      login_as(user)
      visit root_path
      click_link "Add New Donut"
      click_link "Home"

      expect(page).to have_content("Donut Judge Me")
      expect(page).to have_content(donut.name)
    end

    scenario "I can navigate to the donuts index from the add new vendor
      page" do
      login_as(user)
      visit root_path
      click_link "Add New Vendor"
      click_link "Home"

      expect(page).to have_content("Donut Judge Me")
      expect(page).to have_content(donut.name)
    end

    scenario "I can navigate to the donuts index page from the vendors
      section" do
      login_as(user)
      visit root_path
      click_link "All Vendors"
      click_link "Home"

      expect(page).to have_content("Donut Judge Me")
      expect(page).to have_content(donut.name)
    end
  end

  context "as an unauthenticated user" do
    scenario "I can navigate to the donuts index from an individual donut
      show page" do
      visit root_path
      click_link donut.name
      click_link "Home"

      expect(page).to have_content("Donut Judge Me")
      expect(page).to have_content(donut.name)
    end

    scenario "I can navigate to the donuts index page from the vendors
      section" do
      visit root_path
      click_link "All Vendors"
      click_link "Home"

      expect(page).to have_content("Donut Judge Me")
      expect(page).to have_content(donut.name)
    end
  end
end
