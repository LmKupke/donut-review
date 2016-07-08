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

  scenario "an unauthenticated user is directed to the root and sees a
    list of donuts" do
    visit root_path

    expect(page).to have_content "Glazed"
    expect(page).to_not have_link "Add New Donut"
  end

  scenario "an authenticated user is directed to root and sees a list of
    donuts and a link to add a new donut" do
    user = create(:user)
    login_as(user)
    visit root_path

    expect(page).to have_content "Glazed"
    expect(page).to have_link "Add New Donut"
  end

  scenario "an authenticated user clicks the name of an individual donut and is
    taken to that donut's show page" do
    user = create(:user)
    login_as(user)
    visit root_path
    click_link donut.name

    expect(page).to have_content donut.name
    expect(page).to have_content donut.description
    expect(page).to have_content donut.vendor_name
    expect(page).to have_css("img#individual-donut")
  end
end
