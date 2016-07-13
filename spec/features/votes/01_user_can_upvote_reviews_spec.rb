require 'rails_helper'
feature "user upvotes donut ratings", %{
  As a user
  I want to upvote and downvote ratings for a donut
  So I can act like I'm on Reddit
}, js: true do
  context 'as an unauthenticated user, ' do
    let!(:donut) { create(:donut) }
    let!(:review) { create(:review, donut: donut, user: donut.user) }
    before(:each) do
      visit root_path
      click_link "Glazed"
    end

    scenario 'I visit donut review page' do
      expect(page).to have_button('+1')
      expect(page).to have_button('-1')
    end

    scenario "Shows user error message to sign in before voting" do
      click_button('+1')
      expect(page).to have_content('0')
    end
  end

  context 'as an authenticated user, ' do
    let!(:review) { create(:review) }
    let!(:authenticated_user) { create(:user) }
    before(:each) do
      login_as(authenticated_user)
      visit root_path
      click_link 'Glazed'
    end

    scenario 'I visit donut review page' do
      expect(page).to have_content('+1')
      expect(page).to have_content('-1')
    end

    scenario 'I upvote a review' do
      click_button('+1')
      expect(page).to have_content('1')

      click_button('+1')
      expect(page).to have_content('0')
    end

    xscenario 'I downvote a review' do
      click_button('-1')

      expect(page).to have_content('-1')

      click_button('-1')

      expect(page).to have_content('-1')
    end

    xscenario 'I upvote and downvote a review' do
      click_button('+1')
      click_button('-1')

      expect(page).to have_content('0')
    end
  end
end
