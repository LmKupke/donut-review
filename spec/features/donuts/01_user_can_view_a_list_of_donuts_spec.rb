require 'rails_helper'

# As a user
# I want to be able to navigate to the donuts' page
# To look at delicious donuts

feature "user sees a list of donuts" do
  scenario "sees a list of donuts and a link for a new donut" do
    donut_1 = Donut.create(name: "Coconut",
    description: "Most amazing donut ever",
    vendor_name: "Donna's Donuts",
    image: "http://kitchenconfidante.com/wp-content/uploads/2013/02/Baked-Coconut-Doughnuts-Kitchen-Confidante-3.jpg",
    user_id: 4)

    donut_2 = Donut.create(name: "Glazed",
    vendor_name: "Dunkin' Donuts",
    image: "http://alloveralbany.com/images/schuyler_glazed_donut.jpg",
    user_id: 7)

    visit donuts_path

    expect(page).to have_content "Coconut"
    expect(page).to have_link "Glazed"

    click_link "Add New Donut"

    expect(page).to have_content "New Donut Form"
  end

  scenario "clicks link and is taken to show page for a given donut" do
    donut_1 = Donut.create(name: "Coconut",
    description: "Most amazing donut ever",
    vendor_name: "Donna's Donuts",
    image: "http://kitchenconfidante.com/wp-content/uploads/2013/02/Baked-Coconut-Doughnuts-Kitchen-Confidante-3.jpg",
    user_id: 4)

    visit root_path

    click_link "Coconut"

    expect(page).to have_content donut_1.name
    expect(page).to have_content donut_1.description
    expect(page).to have_content donut_1.vendor_name
    expect(page).to have_css("a[href='#{image}']")
  end
end
