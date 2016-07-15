require "rails_helper"

feature "user sees average donut rating", %{
   As a user
   I want to see an average donut rating
   So I can decide if I want to try it without reading all reviews
  } do
  let!(:donut) { create(:donut) }
  let!(:user) { create(:user) }

  context "as an authenticated user" do
    let!(:authenticated_user) { create(:user) }
    before(:each) do
      login_as(authenticated_user)
      visit root_path
    end

    scenario "I want to review a donut" do
      click_link('Glazed')
      choose('5')
      click_button('Create Review')
      choose('3')
      click_button('Create Review')
      expect(page).to have_content('| 4.0 Stars')
      # 4.0 because FactoryGirl automatically makes a 5 star review
    end
  end
end
