require "rails_helper"

feature "User uploads" do
  include_context "current user signed in"

  scenario "avatar photo" do
    visit edit_user_registration_path
    attach_file("user_avatar", "#{Rails.root}/app/assets/images/noavatar.png")
    click_button "Update"
    expect(page).to have_content("Your account has been updated successfully.")
  end
end
