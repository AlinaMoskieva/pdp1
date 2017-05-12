require "rails_helper"

feature "User updates article" do
  include_context "current user signed in"

  let!(:article) { create :article, user: current_user }
  let!(:another_article) { create :article }

  let(:attributes) { attributes_for(:article).slice(:title, :text) }

  before do
    visit article_path(article)
  end

  def find_edit_article_link
    within ".form-actions" do
      expect(page).to have_link("Edit")
      click_link("Edit")
    end
  end

  scenario "with valid data" do
    find_edit_article_link

    fill_form(:article, attributes)

    click_button "Update Article"

    expect(page).to have_content(attributes[:title])
    expect(page).to have_content(attributes[:text])
  end

  scenario "with invalid data" do
    find_edit_article_link

    fill_form(:article, title: "", text: "")

    click_button "Update Article"

    expect(page).to have_content(I18n.t("flash.actions.update.alert", resource_name: Article))
  end

  scenario "not his comment" do
    visit article_path(another_article)
    within ".form-actions" do
      expect(page).not_to have_link("Edit")
    end
  end
end
