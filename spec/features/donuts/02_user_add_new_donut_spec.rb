require "rails_helper"

feature "user adds a new donut", %{
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
  before(:each) do
    user = create(:user)
    login_as(user)
    visit root_path
  end

  scenario "User see a new donut form with correct inputs" do
    click_link "Add New Donut"

    expect(page).to have_css("input#donut_name")
    expect(page).to have_css("select#donut_vendor_id")
    expect(page).to have_css("input#donut_image")
    expect(page).to have_css("textarea#donut_description")
  end

  scenario "User fills in new donut form inputs sucessfully!" do
    vendor = create(:vendor)
    click_link "Add New Donut"
    fill_in("Name", with: "glazed")
    select(vendor.name, from: "Vendor")
    fill_in("Image", with: "https://goo.gl/dfV24M")
    fill_in("Description", with: "Everyone loves this donut.")
    click_button("Create Donut")

    expect(page).to have_content("glazed")
  end

  scenario "User fills in new donut form inputs incorrectly" do
    vendor = create(:vendor)
    click_link "Add New Donut"
    fill_in("Name", with: "")
    select(vendor.name, from: "Vendor")
    fill_in("Image", with: "")
    fill_in("Description", with: "")
    click_button("Create Donut")

    expect(page).to have_content("New Donut Form")
  end
end
