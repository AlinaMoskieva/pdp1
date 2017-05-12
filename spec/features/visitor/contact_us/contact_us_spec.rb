require "rails_helper"

feature "As visitor I able send feedback via contact form" do
  before do
    visit root_path
    click_link "Contact us"
  end

  scenario "with valid data" do
    fill_in "feedback_email", with: "user@example.com"
    fill_in "feedback_subject", with: "Test subject"
    fill_in "feedback_content", with: "Test content"
    click_button "Send feedback"

    expect(page).to have_content(I18n.t("flash.actions.create.notice", resource_name: Feedback))
  end

  scenario "with invalid data" do
    fill_in "feedback_email", with: "user@example.com"
    fill_in "feedback_content", with: "Test content"
    click_button "Send feedback"

    expect(page).to have_content(I18n.t("flash.actions.create.alert", resource_name: Feedback))
  end
end
