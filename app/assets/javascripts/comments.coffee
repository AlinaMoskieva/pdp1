class Comment
  constructor: (el)->
    @el = el
    @$el = $(el)
    @comment_body = $(".js-comment__body", @$el)
    @edit_button = $(".js-edit-comment", @$el)
    @destroy_button = $(".js-destroy-comment", @$el)

    @bindings()

  bindings: (el)->
    @destroy_button.on "click", @destroyComment
    @edit_button.on "click", @editComment

  destroyComment: (event)=>
    event.preventDefault()
    url = @destroy_button.data("url")

    $.ajax(
      url: url
      method: "DELETE"
      dataType: "json"
      success: =>
        @$el.hide()
    )

  editComment: (event)=>
    event.preventDefault()
    url = @edit_button.data("url")

    @edit_button.hide()
    @comment_body.html((JST["templates/comment_form"])({ action: url }))

$ ->
  comments = $(".js-comment")
  new Comment(comment) for comment in comments

  $(document).on("fragment:update", (e, $newContent) ->
    $newContent.findAndFilter(".discussion")
    new Comment(comment) for comment in $newContent
  )
