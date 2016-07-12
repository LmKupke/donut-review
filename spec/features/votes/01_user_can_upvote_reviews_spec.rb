require 'rails_helper'

feature "user upvotes donut ratings", %{
  As a user
  I want to upvote and downvote ratings for a donut
  So I can act like I'm on Reddit
} do


  context 'as an unauthenticated user' do
    let!(:donut) { create(:donut) }
    before(:each) do
      visit root_path
      click_link "Glazed"
    end
    scenario 'I visit the root path and there is a new vendor button' do
      save_and_open_page
    end

    scenario 'I add a new vendor correctly' do

    end

    context ' as an authenticated user' do
      let!(:authenticated_user) { create(:user) }
      before(:each) do
        login_as(authenticated_user)
        visit root_path
      end
    end
  end
end
