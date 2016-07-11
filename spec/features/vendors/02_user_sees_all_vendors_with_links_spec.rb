require 'rails_helper'

feature 'user sees all vendors', %{
  As a user
  I want to see all possible vendors
  So I can see who has the best donuts
} do
  let!(:vendor) { create(:vendor) }

  context 'Unuthenticated user' do
    scenario 'user visits page without signing in' do
      visit root_path
      expect(page).to have_link('All Vendors')

      click_link('All Vendors')
      expect(page).to have_content('Vendors')
      expect(page).to have_link("Donna's Donuts")
      expect(page).to have_content("Boston, MA")
    end
  end

  context 'Authenticated user' do
    let!(:authenticated_user) { create(:user) }

    before(:each) do
      login_as(authenticated_user)
      visit root_path
    end

    scenario "signed-in user visits root and clicks all vendors" do
      click_link('All Vendors')

      expect(page).to have_content('Vendors')
      expect(page).to have_link("Donna's Donuts")
      expect(page).to have_content("Boston, MA")
    end
  end
end
