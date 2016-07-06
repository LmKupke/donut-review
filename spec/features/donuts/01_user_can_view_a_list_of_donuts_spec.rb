require "rails_helper"

feature "user sees a list of donuts", %{
   As a user
   I want to be able to navigate to the donuts' page
   To look at delicious donuts
  } do
  # ACCEPTANCE CRITERIA:
  # Root is Donut#index
  # See Links on Donut names
  let(:donut) { Donut.create }
  scenario "sees a list of donuts and a link for a new donut" do
    visit donuts_path

    expect(page).to have_content donut.name
    expect(page).to have_link donut.name

    click_link "Add New Donut"

    expect(page).to have_content "New Donut Form"
  end

  scenario "clicks link and is taken to show page for a given donut" do
    visit donuts_path

    click_link donut.name

    expect(page).to have_content donut.name
    expect(page).to have_content donut.description
    expect(page).to have_content donut.vendor_name
    expect(page).to have_content donut.image
  end
end
