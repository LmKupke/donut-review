require 'rails_helper'
feature "user upvotes donut ratings", %{
  As a user
  I want to upvote and downvote ratings for a donut
  So I can act like I'm on Reddit
} do
  context 'as an unauthenticated user, ' do
    let!(:donut) { create(:donut) }
    let!(:review) { create(:review) }
    before(:each) do
      visit root_path
      click_link "Glazed"
    end
    scenario 'I visit donut review page' do
      expect(page).to have_content('Upvote')
      expect(page).to have_content('Downvote')

      click_link('Upvote')

      expect(page).to have_content('Please sign in before upvoting')
    end
  end

  context 'as an authenticated user, ' do
    let!(:authenticated_user) { create(:user) }
    before(:each) do
      login_as(authenticated_user)
      visit root_path
      click_link 'Glazed'
    end

    scenario 'I visit donut review page' do
      expect(page).to have_content('Upvote')
      expect(page).to have_content('Downvote')
    end

    scenario 'I upvote a review' do
      click_link('Upvote')

      expect(page).to have_content('+1')

      click_link('Upvote')
      expect(page).to have_content('+1')
    end

    scenario 'I downvote a review' do
      click_link('Downvote')

      expect(page).to have_content('-1')

      click_link('Downvote')

      expect(page).to have_content('-1')
    end

    scenario 'I upvote and downvote a review' do
      click_link('Upvote')
      click_link('Downvote')

      expect(page).to have_content('0')
    end
  end
end
