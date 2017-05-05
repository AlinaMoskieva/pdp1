class ArticleCommentsController < ApplicationController
  respond_to :html, :json

  expose(:comment, attributes: :comment_params)
  expose :article
  expose :comments, :fetch_comments

  before_action :authorize_resource, only: %i(create update destroy)

  def create
    comment.article = article
    comment.user = current_user

    if comment.save
      render partial: "discussion", locals: { comments: comments }, layout: false
    else
      redirect_to article, alert: "Comment could not be created."
    end
  end

  def update
    comment.update(comment_params)
    respond_with(comment, location: comment.article)
  end

  def destroy
    comment.destroy
    respond_with(comment, location: nil)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_resource
    authorize comment
  end

  def fetch_comments
    article.comments.includes(:user).decorate
  end
end
