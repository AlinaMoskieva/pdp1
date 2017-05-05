class Comment
  constructor: (el)->
    @el = el
    @$el = $(el)
    @comment_body = $(".js-comment__body", @$el)
    @edit_button = $(".js-comment__edit-button > a", @$el)
    @destroy_button = $(".js-comment__destroy-button > a", @$el)

    @bindings()

  bindings: (el)->
    @destroy_button.on "click", @destroyComment
    @edit_button.on "click", @editComment

  destroyComment: (event)=>
    event.preventDefault()

    url = @destroy_button.attr("href")
    console.log(url)

    $.ajax(
      url: url
      method: "DELETE"
      dataType: "json"
      success: =>
        @$el.hide()
    )

  editComment: (event)=>
    event.preventDefault()
    url = @edit_button.attr("href").split("/edit")[0]

    @edit_button.hide()
    @comment_body.html((JST["templates/comment_form"])({ action: url }))

$ ->
  comments = $(".comment")
  new Comment(comment) for comment in comments
