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
    # @changeAvatarFromCahce()

  downMenu: (event)=>
    @changeAvatarButton.click()

  changeAvatarPhoto: (event)=>
    @avatar.find("img").attr "src", URL.createObjectURL(event.target.files[0])
    console.log(URL.createObjectURL(event.target.files[0]))

  # changeAvatarFromCahce: (event)=>
    # if @avatarCache?
      # console.log(@avatarCache.val())
      # console.log(URL.createObjectURL(@avatarCache.val()))

$ ->
  new Avatar(".edit-user-information")
