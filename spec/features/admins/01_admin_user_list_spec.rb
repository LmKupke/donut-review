require 'rails_helper'

feature "admin sees a list of users", %{
   As a admin
   I want to be able to see a list of users.
   I want to be able to delete a user.
  } do
  context "as an authenticated admin" do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user, first_name: "John", last_name: "Smith") }
    before(:each) do
      admin = create(:user, role: "admin", first_name: "Boss", last_name: "Bey")
      login_as(admin)
      visit root_path
      click_link "Admin Section"
    end

    scenario "I will visit admin page and see a list of users" do
      expect(page).to have_content("Admin Section")
      expect(page).to have_button "Delete"
      expect(page).to have_content(user1.fullname)
      expect(page).to have_content(user2.fullname)
    end
  end

  context "as an authenticated user, but not admin" do
    scenario "user can't see the admin session" do
      user1 = create(:user)
      login_as(user1)
      visit root_path
      expect(page).to_not have_link("Admin Section")
    end
  end
end
