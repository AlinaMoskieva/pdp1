require "rails_helper"

feature "User destroys" do
  let!(:user) { create :user }
  let!(:article) { create :article, user: user }
  let!(:another_article) { create :article }

  before { login_as user }

  scenario "his article" do
    visit article_path(article)

    within ".article" do
      expect(page).to have_link("Delete")
      click_link "Delete"
    end
    expect(page).to have_content("Article was successfully destroyed.")
  end

  scenario "not his article" do
    visit article_path(another_article)
    within ".article" do
      expect(page).not_to have_link("Delete")
    end
  end
end
