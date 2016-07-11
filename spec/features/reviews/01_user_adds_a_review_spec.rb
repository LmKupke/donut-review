require "rails_helper"
feature "user reviews a donut" do
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
