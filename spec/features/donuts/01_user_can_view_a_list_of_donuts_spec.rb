require "rails_helper"

feature "user sees a list of donuts", %{
   As a user
   I want to be able to navigate to the donuts' page
   To look at delicious donuts
  } do
  # ACCEPTANCE CRITERIA:
  # Root is Donut#index
  # See Links on Donut names

  let!(:donut) { create(:donut) }

  context "as an unauthenticated user" do
    scenario "I will be directed to the root and see a list of donuts" do
      visit root_path

      expect(page).to have_content "Glazed"
      expect(page).to_not have_link "Add New Donut"
    end
  end

  context "as an authenticated user" do
    let!(:authenticated_user) { create(:user) }

    before(:each) do
      login_as(authenticated_user)
      visit root_path
    end
    scenario "an authenticated user is directed to root and sees a list of
      donuts and a link to add a new donut" do

      expect(page).to have_content "Glazed"
      expect(page).to have_link "Add New Donut"
    end

    scenario "an authenticated user clicks the name of an individual donut and
      is taken to that donut's show page" do
      click_link donut.name

      expect(page).to have_content donut.name
      expect(page).to have_content donut.description
      expect(page).to have_content donut.vendor_name
      expect(page).to have_css("img#individual-donut")
    end
  end
end
