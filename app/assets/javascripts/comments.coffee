class Comment
  constructor: (el)->
    @el = el
    @$el = $(el)
    @comment_body = $(".js-comment__body", @$el)
    @comment_author = $(".comment__author-name", @$el)
    @edit_button = $(".js-comment__edit-button > a", @$el)
    @destroy_button = $(".js-comment__destroy-button > a", @$el)

    @bindings()

  bindings: (el)->
    @edit_button.on "click", @editComment
    @destroy_button.on "click", @destroyComment

  destroyComment: (event)=>
    event.preventDefault()

    url = @destroy_button.attr("href")
    console.log(url)

  editComment: (event)=>
    event.preventDefault()

    url = @edit_button.attr("href")
    console.log(url)
    @comment_body.replaceWith("#{ j(render 'article_comments/edit' , remote: true )}")
    @edit_button.hide()
    # @comment_author.append('
    #   <form novalidate="novalidate" class="edit_comment" action="/article_comments/23" method="post">
    #     <div class="input string required comment_body">
    #       <label class="string required" for="comment_body">
    #         <abbr title="required">*</abbr> Your comment
    #       </label>
    #       <input class="string required" type="text" value="test" name="comment[body]" id="comment_body"></div>
    #     </div>
    #     <input type="submit" name="commit" value="Update Comment" class="button hollow button" id="comment-submit-button">
    #   </form>')

$ ->
  new Comment(".comment")
