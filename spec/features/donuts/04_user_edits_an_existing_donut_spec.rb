require "rails_helper"

feature "user edits an existing donut", %{
  As an authenticated donut creator
  I want to edit a Donut I added
  So I can correct mistakes I made }, js: true do
  describe "user sees donut" do
    before(:each) do
      @donut = create(:donut)
      @creator = @donut.user
      @not_creator = create(:user)
    end

    context "user is donut creator" do
      scenario "user clicks edit button and is taken to edit form" do
        login_as(@creator)
        visit root_path
        click_link @donut.name
        click_button "Edit"

        expect(page).to have_css("input#donut_name")
        expect(page).to have_css("select#donut_vendor_id")
        expect(page).to have_css("input#donut_image")
        expect(page).to have_css("textarea#donut_description")
      end

      scenario "user edits donut with valid information" do
        login_as(@creator)
        visit root_path
        click_link @donut.name
        click_button "Edit"
        fill_in("Name", with: "New Name")
        fill_in("Description", with: "A most interesting description")
        click_button("Update Donut")

        expect(page).to have_content("New Name")
        expect(page).to have_content("A most interesting description")
        expect(page).to have_content("Donut successfully updated")
      end

      scenario "user edits donut with invalid information" do
        login_as(@creator)
        visit root_path
        click_link @donut.name
        click_button "Edit"
        fill_in("Name", with: "")
        fill_in("Description", with: "")

        expect(page).to have_content("Edit Donut Form")
      end
    end

    context "user is not donut's creator" do
      scenario "if user is not creator, there is no link to edit donut" do
        login_as(@not_creator)
        visit root_path
        click_link @donut.name

        expect(page).to_not have_button("Edit")
      end
    end
  end
end
