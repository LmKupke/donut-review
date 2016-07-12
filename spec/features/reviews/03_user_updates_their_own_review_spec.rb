require "rails_helper"

feature "user updates a review" do
  let!(:donut) { create(:donut) }

  scenario "user is the review creator" do
    user = create(:user)
    login_as(user)
    visit root_path
    click_link donut.name
    choose("5")
    fill_in(:review_body, with: "wunderbar")
    click_button "Create Review"
    click_button "Edit"
    choose("1")
    fill_in(:review_body, with: "actually, not so wunderbar")
    click_button "Update Review"

    expect(page).to have_content("1")
    expect(page).to have_content("actually, not so wunderbar")
  end

  scenario "user is not the review creator" do
    review = create(:review)
    user = create(:user)
    login_as(user)
    visit root_path
    first(:link, donut.name).click

    expect(page).to_not have_button("Edit")
  end
end
