require "rails_helper"

feature "user adds a new donuts", %{
   As a user
   I want to be able to add a new donut
   So that a user can add reviews
  } do
  # ACCEPTANCE CRITERIA:
  # [ X ] Root is Donut#index
  # [ ] See Add New Donut Link on Root
  # [ ] On donut#new there should be a Form
  # [ ] Submitting correct form takes us to donut#show
  # [ ] Submitting incorrect renders the form with errors
  before(:each) do
    visit root_path
  end

  scenario "User see a new donut form with correct inputs" do
    click_link "Add New Donut"
    expect(page).to have_css("input#donut_name")
    expect(page).to have_css("input#donut_vendor_name")
    expect(page).to have_css("input#donut_image")
    expect(page).to have_css("textarea#donut_description")
    expect(page).to have_css("input#donut_user_id")
  end

  scenario "User fills in new donut form inputs sucessfully!" do
    click_link "Add New Donut"
    fill_in("Name", with: "glazed")
    fill_in("Vendor name", with: "best")
    fill_in("Image", with: "https://goo.gl/dfV24M")
    fill_in("Description", with: "Everyone loves this donut.")
    fill_in("User", with: 1)

    click_button("Create Donut")

    expect(page).to have_content("glazed")
  end

  scenario "User fills in new donut form inputs incorrectly" do
    click_link "Add New Donut"
    fill_in("Name", with: "glazed")
    fill_in("Vendor name", with: "")
    fill_in("Image", with: "")
    fill_in("Description", with: "Everyone loves this donut.")
    fill_in("User", with: 1)
    click_button("Create Donut")

    expect(page).to have_content("New Donut Form")
  end
end
