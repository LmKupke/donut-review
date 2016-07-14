require "rails_helper"

feature "user adds a new donut with a new vendor", %{
   As a user
   I want to be able to add a new donut and a new vendor
   So that a user can add reviews
  } do
  # ACCEPTANCE CRITERIA:
  # [X] Root is Donut#index
  # [X] See Add New Donut Link on Root
  # [X] On donut#new there should be a Form
  # [X] Submitting correct form takes us to donut#show
  # [X] Submitting incorrect renders the form with errors

  scenario "User fills in new donut form and doesn't see Vendor Form" do
    user = create(:user)
    login_as(user)
    visit root_path
    vendor = create(:vendor)
    click_link "Add New Donut"
    fill_in("Name", with: "glazed")
    select(vendor.name, from: "Vendor")
    attach_file('Image', "#{Rails.root}/spec/support/images/photo.png")
    fill_in("Description", with: "Everyone loves this donut.")

    expect(page).to_not have_content("#new_donut_vendor")
  end

  scenario "User fills in new donut form & sees a new Vendor form", js: true do
    user = create(:user)
    vendor = create(:vendor)
    login_as(user)
    visit root_path
    click_link "Add New Donut"
    fill_in("Name", with: "glazed")
    select(vendor.name, from: "Vendor")
    select("Add New Vendor", from: "Vendor")
    attach_file('Image', "#{Rails.root}/spec/support/images/photo.png")
    fill_in("Description", with: "Everyone loves this donut.")

    expect(page).to have_css("input#vendor_name")
  end

  scenario "User fills in new donut form & Vendor form", js: true do
    user = create(:user)
    vendor = create(:vendor)
    login_as(user)
    visit root_path
    click_link "Add New Donut"
    fill_in("Name", with: "glazed")
    select(vendor.name, from: "Vendor")
    select("Add New Vendor", from: "Vendor")
    attach_file('Image', "#{Rails.root}/spec/support/images/photo.png")
    fill_in("Description", with: "Everyone loves this donut.")

    fill_in('Vendor Name', with: 'Union Square Donuts')
    fill_in('Street number', with: '42')
    fill_in('Street name', with: 'Wallaby Way')
    fill_in('City', with: 'Sydney')
    select('SC', from: 'State')
    fill_in('Zipcode', with: '90210')

    click_button("Create Donut")

    expect(page).to have_content("glazed")
  end
end
