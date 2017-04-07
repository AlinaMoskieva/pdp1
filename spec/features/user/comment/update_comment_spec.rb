require "rails_helper"

feature "User updates comment" do
  let!(:article) { create :article }
  let!(:user) { create :user }
  let!(:comment) { create :comment, article: article, user: user }
  let(:comment_body) { Faker::Lorem.sentence(1) }
  let!(:another_article) { create :article }
  let!(:another_comment) { create :comment, article: another_article }

  before do
    # TODO: include_context "current user signed in"
    login_as user
    visit article_path(article)
  end

  scenario "with valid data" do
    expect(page).to have_link("Edit")
    click_link "Edit"

    fill_in "comment_body", with: comment_body

    expect(page).to have_button("Update Comment")
    click_button "Update Comment"

    expect(page).to have_content(comment_body)
  end

  scenario "with invalid data" do
    expect(page).to have_link("Edit")
    click_link "Edit"

    fill_in "comment_body", with: ""

    expect(page).to have_button("Update Comment")
    click_button "Update Comment"

    expect(page).to have_content("Comment could not be updated.")
  end

  scenario "not his comment" do
    visit article_path(another_article)
    within ".form-actions" do
      expect(page).not_to have_link("Edit")
    end
  end
end
