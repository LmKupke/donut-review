require 'rails_helper'

feature 'reviews are paginated' do
  let!(:donut) { create(:donut) }
  context 'many reviews exist' do
    scenario "see another review on page two of index" do
      create_list(:review, 11, donut: donut)
      visit root_path
      click_link "Glazed"
      expect(page).to have_link("2")
      click_link('2')
      expect(page).to have_content('wunderbar')
    end
  end
end
