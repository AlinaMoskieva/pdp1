require "rails_helper"

feature "User creates comment" do
  include_context "current user signed in"

  let!(:article) { create :article }
  let!(:user) { create :user }
  let(:attributes) { attributes_for(:comment).slice(:body) }

  before do
    visit article_path(article)
  end

  scenario "with valid data" do
    fill_in :comment_body, with: attributes[:body]
    expect(page).to have_button "Create Comment"
    click_button "Create Comment"

    expect(page).to have_content(attributes[:body])
  end

  scenario "with invalid data" do
    expect(page).to have_button "Create Comment"

    click_button "Create Comment"

    expect(page).to have_content("Comment could not be created.")
  end
end
