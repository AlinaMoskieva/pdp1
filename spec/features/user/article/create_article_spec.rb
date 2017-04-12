require "rails_helper"

feature "User creates article" do
  include_context "current user signed in"

  let(:attributes) { attributes_for(:article).slice(:title, :text) }

  before do
    visit articles_path
  end

  def find_new_article_link
    expect(page).to have_link("New Article")
    click_link "New Article"
  end

  scenario "Create article with with valid data" do
    find_new_article_link

    fill_form(:article, attributes)

    click_button "Create Article"

    expect(page).to have_content(attributes[:title])
    expect(page).to have_content(attributes[:text])
  end

  scenario "article with invalid data" do
    find_new_article_link

    click_button "Create Article"

    expect(page).to have_content("Article could not be created.")
  end
end
