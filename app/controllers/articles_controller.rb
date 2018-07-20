class ArticlesController < ApplicationController
  respond_to :html

  expose_decorated :article
  expose_decorated :articles, :fetch_articles
  expose_decorated :comments, :fetch_comments
  before_action :authorize_resource, only: %i(create update destroy)

  def create
    article.user = current_user
    article.save

    respond_with(article)
  end

  def index
    puts request.location.data
    puts 'alina'
    puts 'alina'
    puts 'alina'
    puts 'alina'
    puts 'alina'
    puts 'alina'
    puts 'alina'
    puts 'alina'
    puts 'alina'
    puts 'alina'
    puts 'alina'
    puts 'alina'
    puts request.location.data["lat"]
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
    authorize(article)
  end

  def fetch_articles
    Article.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
  end

  def fetch_comments
    article.comments.includes(:user)
  end
end
