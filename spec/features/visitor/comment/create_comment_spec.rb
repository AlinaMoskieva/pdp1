require "rails_helper"

feature "As visitor I can't" do
  let(:article) { create :article }
  let(:panel_content) { "You should sign in for have ability to add comments" }

  scenario "create comment" do
    visit article_path(article)
    expect(page).not_to have_button "Create Comment"
    expect(page).to have_content(panel_content)
  end
end
