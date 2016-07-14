require 'rails_helper'

feature 'donuts index on root path live updates', %{
  As a user
  I want to see recently added donuts on the index page without refreshing
  So that I have a better idea of which donuts are worth it
} do

  context 'unauenthciated user and authenticated user are both on the site' do
    before(:each) do
      @user = create(:user)
      vendor = create(:vendor)
    end

    scenario 'unauthenticated user sees index update as authenticated user adds donut', js: true do
      in_browser(:two) do
        visit root_path

        expect(page).to_not have_content('Not Glazed')
      end

      in_browser(:one) do
        login_as @user
        visit root_path
        click_link "Add New Donut"
        fill_in "Name", with: "Not Glazed"
        select("Donna's Donuts", from: "Vendor")
        fill_in "Image", with: 'http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=61471748'
        fill_in "Description", with: 'just keep swimming'
        click_button "Create Donut"
        visit root_path

        expect(page).to have_content('Not Glazed')
      end

      in_browser(:two) do
        # save_and_open_screenshot
        # expect(page).to have_content('Not Glazed')
      end

    end
  end
end
