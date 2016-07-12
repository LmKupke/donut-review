require "rails_helper"

feature "user deletes a review" do
  let!(:donut) { create(:donut) }

  scenario "user is the review creator" do
    user = create(:user)
    login_as(user)
    visit root_path
    click_link donut.name
    choose("5")
    fill_in(:review_body, with: "wunderbar")
    click_button "Create Review"
    click_button "Delete"

    expect(page).to_not have_content("wunderbar")
  end

  scenario "user is not the review creator" do
    user = create(:user)
    login_as(user)
    visit root_path
    first(:link, donut.name).click

    expect(page).to_not have_button("Delete")
  end
end
