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

  context "user authenticated" do
    before(:each) do
      user = create(:user)
      login_as(user)
      visit root_path
      click_link donut.name
    end

    scenario "sees review form on donut show page" do
      expect(page).to have_css('form')
    end

    scenario "user submits a review" do
      choose("3")
      fill_in(:review_body, with: "great!")
      click_button "Create Review"
      expect(page).to have_content("great!")
    end

    scenario "user submits an invalid review" do
      fill_in(:review_body, with: "great!")
      click_button "Create Review"

      expect(page).to_not have_content("great!")
    end
  end

  context "user unauthenticated" do
    scenario "user does not see review form on donut show page" do
      visit root_path
      click_link donut.name
      expect(page).to_not have_css("form")
    end
  end
end
