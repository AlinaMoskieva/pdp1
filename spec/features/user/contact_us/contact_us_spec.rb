require "rails_helper"

feature "As user I able send feedback via contact form" do
  include_context "current user signed in"

  let(:user) { create :user }
  let(:attributes) { attributes_for(:feedback).slice(:email, :subject, :content) }

  before do
    visit root_path
    click_link "Contact us"
  end

  scenario "with valid data" do
    fill_in "feedback_email", with: attributes[:email]
    fill_in "feedback_subject", with: attributes[:subject]
    fill_in "feedback_content", with: attributes[:content]

    click_button "Send feedback"

    expect(page).to have_content("Feedback was successfully created.")
  end

  scenario "with invalid data" do
    click_button "Send feedback"

    expect(page).to have_content("Feedback could not be created.")
  end
end
