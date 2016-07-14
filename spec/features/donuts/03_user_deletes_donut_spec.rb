require 'rails_helper'

feature "user deletes donut", %{
  As a authenticated donut creator
  I want to delete a Donut
  So that I can rectify my sins } do
  # ACCEPTANCE CRITERIA
  # A User sees the delete button on the show page if they created it
  # Delete button destroys the donuts
  # A user doesn't see the delete button if they did not create the donut

  context "user sees donut" do
    before(:each) do
      @donut = create(:donut)
      @creator = @donut.user
      @not_creator = create(:user)
    end

    scenario "user is donut creator and delete", js: true do
      login_as(@creator)
      visit root_path
      click_link @donut.name
      click_button "Delete"

      expect(page).to_not have_link(@donut.name)
    end

    scenario "user is not donut creator", js: true do
      login_as(@not_creator)
      visit root_path
      click_link @donut.name

      expect(page).to_not have_button("Delete")
    end
  end
end
