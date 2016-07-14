require 'rails_helper'

feature 'reviews are paginated after 10 per page', js: true do
  let!(:donut) { create(:donut) }
  context 'enough reviews exist to cause pagination' do
    scenario "eleventh review appears on page two of index" do
      create_list(:review, 11, donut: donut)

      visit root_path
      click_link "Glazed"
      expect(page).to have_link("2")
      click_link('2')

      expect(page).to have_content('wunderbar')
    end
  end
end
