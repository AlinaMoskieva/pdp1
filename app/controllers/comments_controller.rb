class CommentsController < ApplicationController
  respond_to :html

  expose :comment
  expose :article
  before_action :authorize_resource, only: %i(create update destroy)

  def create
    comment.article = article
    comment.user = current_user
    comment.save
    respond_with(comment, location: comment.article)
  end

  def update
    comment.update_attributes(comment_params)
    respond_with(comment, location: comment.article)
  end

  def destroy
    comment.destroy
    respond_with(comment, location: comment.article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_resource
    authorize comment
  end
end
