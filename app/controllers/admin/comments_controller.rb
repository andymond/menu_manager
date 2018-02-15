class Admin::CommentsController < Admin::BaseController
  def destroy
    @comment = Comment.find(params[:id])
    recipe = @comment.recipe
    if @comment.destroy
     flash.notice = "Comment deleted."
    else
     flash.notice = "Comment couldn't be deleted."
    end
    redirect_to admin_recipe_path(recipe)
  end
end
