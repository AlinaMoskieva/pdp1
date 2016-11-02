require "rails_helper"

feature "As user I able to" do
  let!(:article) { create :article }
  let!(:user) { create :user }
  let(:comment_body) { Faker::Lorem.sentence(1) }

  before do
    login_as user
    visit article_path(article)
  end

  describe "create" do
    scenario "comment" do
      fill_in "comment_body", with: comment_body

      expect(page).to have_button "Create Comment"
      click_button "Create Comment"

      expect(page).to have_content(comment_body)
    end
  end
end
