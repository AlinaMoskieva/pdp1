class ArticlesController < ApplicationController
  respond_to :html

  expose_decorated :article
  expose :articles, -> { Article.includes(:user).page(params[:page]) }
  before_action :authorize_resource, only: %i(create update destroy)

  def create
    article.user = current_user
    article.save
    respond_with(article)
  end

  def update
    article.update_attributes(article_params)
    respond_with(article)
  end

  def destroy
    article.destroy
    respond_with(article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def authorize_resource
    authorize article
  end
end
