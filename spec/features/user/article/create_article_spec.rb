require "rails_helper"

feature "As user I able to" do
  let(:user) { create :user }
  let(:title) { Faker::Lorem.sentence(3) }
  let(:text) { Faker::Lorem.sentence(3) }

  describe "create" do
    background do
      login_as user
      visit articles_path
    end

    scenario "article" do
      expect(page).to have_link("New Article")
      click_link "New Article"

      fill_in "Title", with: title
      fill_in "Text", with: text
      click_button "Create Article"

      expect(page).to have_content(title)
      expect(page).to have_content(text)
    end
  end
end
