class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @article = Article.find(params[:article_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.article = Article.find(params[:article_id])
    @comment.save
    redirect_to article_path(@comment.article)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
