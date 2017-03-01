class Avatar
  constructor: (el)->
    @el = el
    @$el = $(el)
    @avatar = $(".user__avatar--large", @$el)
    @avatarCache = $(".change-avatar-cache", @$el)
    @changeAvatarButton = $(".change-avatar-button", @$el)

    @bindings()
    @changeAvatarFromCache()

  bindings: (el)->
    @avatar.on "click", @downMenu
    @changeAvatarButton.on "change", @changeAvatarPhoto

  downMenu: (event)=>
    @changeAvatarButton.click()

  changeAvatarPhoto: (event)=>
    @avatar.find("img").attr "src", URL.createObjectURL(event.target.files[0])

  changeAvatarFromCache: (event)=>
    if @avatarCache.attr("value")
      @avatar.find("img").attr "src", "uploads/tmp/" + @avatarCache.attr("value")

$ ->
  new Avatar(".edit-user-information")
