class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
    @comments = Comment.where('article_id = ?', params[:id])
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
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end