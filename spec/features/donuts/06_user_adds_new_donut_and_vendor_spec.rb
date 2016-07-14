require "rails_helper"

feature "user adds a new donut with a ", %{
   As a user
   I want to be able to add a new donut
   So that a user can add reviews
  } do
  # ACCEPTANCE CRITERIA:
  # [X] Root is Donut#index
  # [X] See Add New Donut Link on Root
  # [X] On donut#new there should be a Form
  # [X] Submitting correct form takes us to donut#show
  # [X] Submitting incorrect renders the form with errors

  context "ljkadfj" do

  # let!(:user) { create (:user) }
  # before(:each) do
  #   login_as(user)
  #   visit root_path
  # end

    scenario "User fills in new donut form and doesn't see Vendor Form" do
      user = create(:user)
      login_as(user)
      visit root_path
      vendor = create(:vendor)
      click_link "Add New Donut"
      fill_in("Name", with: "glazed")
      select(vendor.name, from: "Vendor")
      fill_in("Image", with: "https://goo.gl/dfV24M")
      fill_in("Description", with: "Everyone loves this donut.")

      expect(page).to_not have_content("#new_donut_vendor")
    end
  end

  context "please work" do
    scenario "User fills in new donut form and wants a new Vendor form" do
      user = create(:user)
      vendor = create(:vendor)
      login_as(user)
      visit root_path
      click_link "Add New Donut"
      save_and_open_page
      fill_in("Name", with: "glazed")
      select(vendor.name, from: "Vendor")
      select("Add New Vendor", from: "Vendor")
      fill_in("Image", with: "https://goo.gl/dfV24M")
      fill_in("Description", with: "Everyone loves this donut.")
      expect(page).to have_content("#new_donut_vendor")
    end
  end
end
