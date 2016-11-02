require "rails_helper"

feature "User destroy" do
  let!(:article) { create :article }
  let!(:user) { create :user }
  let!(:comment) { create :comment, article: article, user: user }
  let!(:another_article) { create :article }
  let!(:another_comment) { create :comment, article: another_article }

  before { login_as user }

  scenario "not his comment" do
    visit article_path(another_article)
    expect(page).not_to have_link("Delete")
  end

  scenario "his comment" do
    visit article_path(article)

    expect(page).to have_link("Delete")
    click_link "Delete"

    expect(page).not_to have_content(comment.body)
  end
end
