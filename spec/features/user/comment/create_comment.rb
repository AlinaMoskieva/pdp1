require "rails_helper"

feature "User creates comment" do
  include_context "current user signed in"

  let!(:article) { create :article }
  let!(:user) { create :user }
  let(:comment_body) { Faker::Lorem.sentence(1) }

  before do
    visit article_path(article)
  end

  context "with valid data" do
    fill_in "comment_body", with: comment_body

    expect(page).to have_button "Create Comment"
    click_button "Create Comment"

    expect(page).to have_content(comment_body)
  end

  context "with invalid data" do
    expect(page).to have_button "Create Comment"

    click_button "Create Comment"

    expect(page).to have_content("Comment could not be created.")
  end
end
