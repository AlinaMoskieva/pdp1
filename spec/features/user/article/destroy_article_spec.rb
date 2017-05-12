require "rails_helper"

feature "User destroys article" do
  include_context "current user signed in"

  let!(:article) { create :article, user: current_user }
  let!(:another_article) { create :article }

  scenario "his article" do
    visit article_path(article)

    within ".article" do
      expect(page).to have_link("Delete")
      click_link "Delete"
    end

    expect(page).to have_content(I18n.t("flash.actions.destroy.notice", resource_name: Article))
  end

  scenario "not his article" do
    visit article_path(another_article)

    within ".article" do
      expect(page).not_to have_link("Delete")
    end
  end
end
