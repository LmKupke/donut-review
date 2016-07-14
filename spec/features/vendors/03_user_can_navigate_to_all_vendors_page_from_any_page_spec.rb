require "rails_helper"

feature "user can navigate to all vendors page", %{
  As a user
  I want to be able to navigate to the all vendors page from any page
  To look at all the vendors
}, js: true do
  let!(:donut) { create(:donut) }
  let!(:user) { create(:user) }

  context "as an authenticated user" do
    scenario "I can navigate to the vendors page from an individual donut
      show page" do
      login_as(user)
      visit root_path
      click_link donut.name
      click_link "All Vendors"

      expect(page).to have_content("Vendors")
    end

    scenario "I can navigate to the vendors page from the add new donut
      page" do
      login_as(user)
      visit root_path
      click_link "Add New Donut"
      click_link "All Vendors"

      expect(page).to have_content("Vendors")
    end

    scenario "I can navigate to the vendors page from the add new vendor
      page" do
      login_as(user)
      visit root_path
      click_link "Add New Vendor"
      click_link "All Vendors"

      expect(page).to have_content("Vendors")
    end

    scenario "I can navigate to the vendors page from the donuts index" do
      login_as(user)
      visit root_path
      click_link "All Vendors"

      expect(page).to have_content("Vendors")
    end
  end

  context "as an unauthenticated user" do
    scenario "I can navigate to the vendors page from an individual donut
      show page" do
      visit root_path
      click_link donut.name
      click_link "All Vendors"

      expect(page).to have_content("Vendors")
    end
  end
end
