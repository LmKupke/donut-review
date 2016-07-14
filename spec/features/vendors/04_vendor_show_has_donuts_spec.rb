require "rails_helper"

feature "user can see donuts on vendor page", %{
  As a user
  I want to be able to navigate vendors showpage
  To look at all the donuts that belong to a vendor
} do
  let!(:donut) { create(:donut) }
  let!(:donut2) { create(:donut, vendor: donut.vendor, name: "Chocolate") }

  scenario "I can navigate to the vendors#index page and see a vendor " do
    visit root_path
    click_link "All Vendors"
    expect(page).to have_content("Vendors")
    expect(page).to have_link(donut.vendor.name)
  end

  scenario "I can navigate to the vendors#index page to vendor show and
    see list of donuts " do
    visit root_path
    click_link "All Vendors"
    click_link donut.vendor.name

    expect(page).to have_link(donut.name)
    expect(page).to have_link(donut2.name)
  end
end
