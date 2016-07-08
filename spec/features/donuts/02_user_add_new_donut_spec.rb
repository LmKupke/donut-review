require "rails_helper"

feature "user adds a new donut", %{
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

  context "as an unauthenticated user" do
    scenario "I will not be able to add a new donut" do
      visit root_path

      expect(page).to_not have_content("Add New Donut")
    end
  end

  context "as an authenticated user" do
    let(:user) { create(:user) }

    before(:each) do
      login_as(user)
      visit root_path
      click_link "Add New Donut"
    end

    scenario "I can successfully add a new donut by navigating to the root path
      and clicking the Add New Donut link" do

      expect(page).to have_css("input#donut_name")
      expect(page).to have_css("input#donut_vendor_name")
      expect(page).to have_css("input#donut_image")
      expect(page).to have_css("textarea#donut_description")
      expect(page).to have_css("input#donut_user_id")
    end

    scenario "I can successfully add a new donut by filling form with valid
      inputs" do
      fill_in("Name", with: "glazed")
      fill_in("Vendor name", with: "best")
      fill_in("Image", with: "https://goo.gl/dfV24M")
      fill_in("Description", with: "Everyone loves this donut.")
      fill_in("User", with: 1)

      click_button("Create Donut")

      expect(page).to have_content("glazed")
    end

    scenario "I will not be able to add a donut if I submit the new donut form
      incorrectly. The form will also be re-rendered" do
      fill_in("Name", with: "glazed")
      fill_in("Vendor name", with: "")
      fill_in("Image", with: "")
      fill_in("Description", with: "Everyone loves this donut.")
      fill_in("User", with: 1)

      click_button("Create Donut")

      expect(page).to_not have_content("Glazed")
      expect(page).to have_content("New Donut Form")
    end
  end
end
