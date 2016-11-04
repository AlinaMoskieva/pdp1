require "rails_helper"

feature "As visitor I can't" do
  scenario "create article" do
    visit articles_path
    expect(page).not_to have_button("Create Article")
  end
end
