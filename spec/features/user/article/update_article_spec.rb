require "rails_helper"

feature "User updates article" do
  include_context "current user signed in"

  let!(:article) { create :article, user: current_user }
  let!(:another_article) { create :article }
  let(:title) { Faker::Lorem.sentence(3) }
  let(:text) { Faker::Lorem.sentence(3) }

  before do
    visit article_path(article)
  end

  def find_edit_article_link
    within ".form-actions" do
      expect(page).to have_link("Edit")
      click_link("Edit")
    end
  end

  scenario "comment with valid data" do
    find_edit_article_link

    # TODO: formulaic
    fill_in "Title", with: title
    fill_in "Text", with: text
    click_button "Update Article"

    expect(page).to have_content(title)
    expect(page).to have_content(text)
  end

  scenario "comment with invalid data" do
    find_edit_article_link

    fill_in "Title", with: ""
    fill_in "Text", with: ""
    click_button "Update Article"

    expect(page).to have_content("Article could not be updated.")
  end

  scenario "not his comment" do
    visit article_path(another_article)
    within ".form-actions" do
      expect(page).not_to have_link("Edit")
    end
  end
end
