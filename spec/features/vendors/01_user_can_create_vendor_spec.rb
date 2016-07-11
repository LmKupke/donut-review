require 'rails_helper'

feature "user sees a vendor form", %{
  As a user
  I want to have access to a vendor form
  So I can add new vendors and see them
} do
  # ACCEPTANCE CRITERIA:
  # [X] Unauthenticated user does not see new vendor link
  # [X] Authenticated user does see a new vendor link_to
  # [X] New vendor link takes user to vendor form
  # [] New vendor form has necessary fields
  # [] Create vendor button creates vendor and takes user to Vendor#show

  let!(:vendor) { create(:vendor) }

  context 'as an unauthenticated user' do
    scenario 'I visit the root path and there is no new vendor button' do
      visit root_path

      expect(page).to_not have_link 'Add New Vendor'
    end
  end

  context 'as an authenticated user' do
    let!(:authenticated_user) { create(:user) }
    before(:each) do
      login_as(authenticated_user)
      visit root_path
    end

    scenario 'I visit the root path and there is a new vendor button' do
      expect(page).to have_link 'Add New Vendor'
    end

    scenario 'I add a new vendor correctly' do
      click_link 'Add New Vendor'
      expect(page).to have_content('New Vendor Form')

      fill_in('Name', with: 'Union Square Donuts' )
      fill_in('Street number', with: '42')
      fill_in('Street name', with: 'Wallaby Way')
      fill_in('City', with: 'Sydney')
      select('SC', from: 'State')
      fill_in('Zipcode', with: '90210')

      click_button('Create Vendor')
      expect(page).to have_content('Union Square Donuts')
      expect(page).to have_content('42 Wallaby Way')
    end
  end
end
