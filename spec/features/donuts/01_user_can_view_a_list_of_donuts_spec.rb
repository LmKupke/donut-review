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
  let!(:user) { create(:user) }

  scenario "sees a list of donuts and a link for a new donut" do
    login_as user
    visit root_path
    expect(page).to have_content donut.name
    expect(page).to have_link donut.name

    click_link "Add New Donut"

    expect(page).to have_content "New Donut Form"
  end

  scenario "clicks linked donut name and is taken to show page" do
    visit root_path

    click_link donut.name

    expect(page).to have_content donut.name
    expect(page).to have_content donut.description

    expect(page).to have_css("img#individual-donut")
  end
end
