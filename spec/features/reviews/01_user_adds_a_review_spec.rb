require "rails_helper"

feature "user reviews a donut", %{
  As an authenticated user
  I would like to add a Review to a Donut
  So that other people know how my donut experience was
  } do
  #ACCEPTANCE CRITERIA
  #Authenticated user sees donut review form on donut show page
  #Unauthenticated user does not see review form
  #Authenticated user can submit review for donut
  #Submitting review reloads donut show page
  #Reloaded page has new review
  let!(:donut) { create(:donut) }

  context "user visits donut show page" do

    scenario "user is authenticated and submits review" do
      user = create(:user)
      login_as(user)
      visit root_path
      click_link donut.name
      expect(page).to have_css("form")
    end

    scenario "user is unauthenticated and does not see review form" do
      visit root_path
      click_link donut.name
      expect(page).to_not have_css("form")
    end
  end
end
