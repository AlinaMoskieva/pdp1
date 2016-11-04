class Avatar
  constructor: (el)->
    @el = el
    @$el = $(el)
    @avatar = $(".user__avatar--large", @$el)
    @changeAvatarButton = $(".change-avatar-button", @$el)

    @bindings()

  bindings: (el)->
    @avatar.on "click", @changeAvatar

  changeAvatar: (event)=>
    @changeAvatarButton.click()
    console.log("submitted!")

$ ->
  new Avatar(".edit-user-information")
