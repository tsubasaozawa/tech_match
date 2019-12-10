class ArticlesController < ApplicationController
  before_action :set_user
  before_action :set_article, only: [:edit, :update]
  def new
    @article = Article.new
  end

  def create
    article = Article.create(article_params.merge(user_id: current_user.id))
    # binding.pry
    if article.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_article
    @article = @user.article
  end

  def article_params
    params.require(:article).permit(:user_id, :first_title, :first_content, :first_image, :second_title, :second_content, :second_image, :third_title, :third_content, :third_image)
  end
end
