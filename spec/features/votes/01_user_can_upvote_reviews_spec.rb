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
      expect(page).to_not have_button('+1')
      expect(page).to_not have_button('-1')
    end
  end

  context 'as an authenticated user, ' do
    before(:each) do
      @review = create(:review)
      authenticated_user = create(:user)
      login_as(authenticated_user)
      visit root_path
      click_link 'Glazed'
    end

    scenario 'I visit donut review page and each review has buttons' do
      expect(page).to have_button('+1')
      expect(page).to have_button('-1')
    end

    # scenario 'I upvote a review and the vote count updates without reload' do
    #   click_button('+1')
    #
    #   expect(page).to have_content('1')
    # end

    scenario 'I downvote a review and the vote count updates without reload' do
      click_button('-1')

      expect(page).to have_content('-1')
    end

    scenario 'I upvote & dwnvote & the vote cnt updates w/o reload' do
      click_button('+1')
      click_button('-1')

      expect(page).to have_content('-1')
    end
  end
end
