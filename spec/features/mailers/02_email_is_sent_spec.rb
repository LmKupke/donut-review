require 'rails_helper'

feature "email is sent" do
  scenario "when home is visited" do
    donut = create(:donut)
    reviewuser = create(:user, first_name: "John", last_name: "Smith")

    login_as(reviewuser)
    visit root_path
    click_link donut.name

    choose("3")
    fill_in(:review_body, with: "Total garbage.")
    click_button "Create Review"

    email = ActionMailer::Base.deliveries.last
    expect(email.to.first).to eq(donut.user.email)
    expect(email.subject).to eq("New Review for #{donut.name}")
  end
end
