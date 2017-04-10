require "rails_helper"

feature "User creates article" do
  include_context "current user signed in"

  let(:title) { Faker::Lorem.sentence(3) }
  let(:text) { Faker::Lorem.sentence(3) }

  before do
    visit articles_path
  end

  def find_new_article_link
    expect(page).to have_link("New Article")
    click_link "New Article"
  end

  scenario "Create article with with valid data" do
    find_new_article_link

    fill_form(:article, { title: title, text: text })

    click_button "Create Article"

    expect(page).to have_content(title)
    expect(page).to have_content(text)
  end

  scenario "article with invalid data" do
    find_new_article_link

    fill_form(:article, { title: "", text: "" })

    click_button "Create Article"

    expect(page).to have_content("Article could not be created.")
  end
end
