require "rails_helper"

feature "User creates article" do
  let(:user) { create :user }
  let(:title) { Faker::Lorem.sentence(3) }
  let(:text) { Faker::Lorem.sentence(3) }

  before do
    login_as user
    visit articles_path
  end

  def find_new_article_link
    expect(page).to have_link("New Article")
    click_link "New Article"
  end

  scenario "Create article with with valid data" do
    find_new_article_link

    fill_in "Title", with: title
    fill_in "Text", with: text
    click_button "Create Article"

    expect(page).to have_content(title)
    expect(page).to have_content(text)
  end

  scenario "article with invalid data" do
    find_new_article_link

    fill_in "Title", with: ""
    fill_in "Text", with: ""
    click_button "Create Article"

    expect(page).to have_content("Article could not be created.")
  end
end
