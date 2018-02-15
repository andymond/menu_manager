class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.recipe_id = params[:recipe_id]
    if @comment.save
      flash.notice = "Comment posted."
      redirect_to recipe_path(params[:recipe_id])
    else
      flash.notice = "Comment couldn't be posted."
      redirect_to recipe_path(@comment.recipe)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user, :body)
  end
end
