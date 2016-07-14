require "rails_helper"

feature "user can search site", %{
 As an authenticated or unauthenticated user
 I want to be able to search the site
 So I can view information that interests me
} do
  let!(:donut) { create(:donut) }
  let!(:user) { create(:user) }

 context "As an unauthenticated user" do
   scenario "I am able to search from the root" do
     visit root_path
     fill_in "query", with: donut.name
     click_button "Search"

     expect(page).to have_content(donut.name)
   end

   scenario "I am able to search from the vendors index" do
     visit root_path
     click_link "All Vendors"
     fill_in "query", with: donut.name
     click_button "Search"

     expect(page).to have_content(donut.name)
   end
 end

 context "As an authenticated user" do
   scenario "I am able to search from the root" do
     login_as(user)
     visit root_path
     fill_in "query", with: donut.name
     click_button "Search"

     expect(page).to have_content(donut.name)
   end

   scenario "I am able to search from the vendors index" do
     login_as(user)
     visit root_path
     click_link "All Vendors"
     fill_in "query", with: donut.name
     click_button "Search"

     expect(page).to have_content(donut.name)
   end

   scenario "I am able to search from the New Donuts page" do
     login_as(user)
     visit root_path
     click_link "Add New Donut"
     fill_in "query", with: donut.name
     click_button "Search"

     expect(page).to have_content(donut.name)
   end

   scenario "I am able to search from the New Vendors page" do
     login_as(user)
     visit root_path
     click_link "Add New Vendor"
     fill_in "query", with: donut.name
     click_button "Search"

     expect(page).to have_content(donut.name)
   end
 end
end
