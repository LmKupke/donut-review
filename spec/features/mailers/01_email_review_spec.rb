require 'rails_helper'

feature "test review content in email_body" do
  scenario "review a product" do
    # Clear out any previously delivered emails

    donut = create(:donut)
    reviewuser = create(:user)

    login_as(reviewuser)
    visit root_path
    click_link donut.name

    choose("3")
    fill_in(:review_body, with: "Total garbage.")
    click_button "Create Review"

    expect(page).to have_content("Total garbage.")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
