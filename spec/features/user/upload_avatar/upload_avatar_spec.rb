require "rails_helper"

feature "User uploads" do
  let!(:user) { create :user }

  scenario "avatar photo" do
    login_as user
    visit edit_user_registration_path
    attach_file("user_avatar", "#{Rails.root}/app/assets/images/noavatar.png")
    click_button "Update"
    expect(page).to have_content("Your account has been updated successfully.")
  end
end
