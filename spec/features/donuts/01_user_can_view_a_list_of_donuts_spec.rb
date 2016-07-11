require "rails_helper"

feature "user sees a list of donuts", %{
   As a user
   I want to be able to navigate to the donuts' page
   To look at delicious donuts
  } do
  # ACCEPTANCE CRITERIA:
  # [X] Root is Donut#index
  # [X] Unauthenticated user is directed to the Donut#index
  # [X] Authenticated user can add a new donut
  # [X] See Links on Donut names
  # [X] Clicking donut name link redirects to donut's show page

  let!(:donut) { create(:donut) }
  let!(:user) { create(:user) }

  context "as an unauthenticated user" do
    scenario "I will visit the root and see a list of donuts" do
      visit root_path

      expect(page).to have_content donut.name
      expect(page).to_not have_link "Add New Donut"
    end
  end

  context "as an authenticated user" do
    let!(:authenticated_user) { create(:user) }
    before(:each) do
      login_as(authenticated_user)
      visit root_path
    end

    scenario "I will visit the root and see a list of donuts and a link to add
      a new donut" do
      expect(page).to have_content donut.name
      expect(page).to have_link "Add New Donut"
    end

    scenario "I will visit the show page of a donut after clicking on its
      name" do
      click_link donut.name

      expect(page).to have_content donut.name
      expect(page).to have_content donut.description
      expect(page).to have_css("img#individual-donut")
    end
  end
end
