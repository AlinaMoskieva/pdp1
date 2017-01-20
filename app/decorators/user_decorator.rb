class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def avatar
    image_tag(object.avatar? ? object.avatar.medium : "noavatar.png")
  end
end
