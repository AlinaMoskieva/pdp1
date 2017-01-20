class Avatar
  constructor: (el)->
    @el = el
    @$el = $(el)
    @avatar = $(".user__avatar--large", @$el)
    @avatarCache = $(".change-avatar-cache", @$el)
    @changeAvatarButton = $(".change-avatar-button", @$el)

    @bindings()

  bindings: (el)->
    @avatar.on "click", @downMenu
    @changeAvatarButton.on "change", @changeAvatarPhoto
    # @$el.on "load", @changeAvatarFromCahce()

  downMenu: (event)=>
    @changeAvatarButton.click()

  changeAvatarPhoto: (event)=>
    @avatar.find("img").attr "src", URL.createObjectURL(event.target.files[0])
    console.log(event.target.files[0])

  changeAvatarFromCahce: (event)=>
    image = new File(@avatarCache, "image")
    console.log("changeAvatarFromCahce")
    console.log(image)

    @avatar.find("img").attr "src", URL.createObjectURL(image)

$ ->
  new Avatar(".edit-user-information")
