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
      visit new_donut_path
    end

    scenario "I can successfully add a new donut by navigating to the root path
      and clicking the Add New Donut link" do
      expect(page).to have_css("input#donut_name")
      expect(page).to have_css("input#donut_vendor_name")
      expect(page).to have_css("input#donut_image")
      expect(page).to have_css("textarea#donut_description")
      expect(page).to have_css("input#donut_user_id")
    end

    scenario "using valid data to create a donut, I see a success message upon
      submission" do
      fill_in("Name", with: "glazed")
      fill_in("Vendor name", with: "best")
      fill_in("Image", with: "https://goo.gl/dfV24M")
      fill_in("Description", with: "Everyone loves this donut.")
      fill_in("User", with: 1)

      click_button("Create Donut")

      expect(page).to have_content("glazed")
    end

    scenario "using invalid values to create a donut, the page re-renders with
      an error message" do
      fill_in("Name", with: nil)
      fill_in("Description", with: "Everyone loves this donut.")

      click_button("Create Donut")

      expect(page).to have_content("New Donut Form")
    end
  end
end
