class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    flash.notice = "Comment by '#{@comment.author_name}' created!"

    @comment.save
    redirect_to article_path(@comment.article)
  end

  private
  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
