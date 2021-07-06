class ArticlesController < ApplicationController
  before_action :select_article, only: [:show, :create, :destroy, :upvote]

  def show
    @comments = Comment.where('article_id = ?', params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.state = State.first
    if @article.save
      redirect_to article_path(@article)
    else
      redirect_to new_article_path
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def upvote
    @upvote = Upvote.new(article_id: @article.id, user_id: current_user.id)
      if @upvote.save
        @article.likes += 1
        @article.save
      end

    redirect_to article_path(@article)
  end

  private

  def select_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
