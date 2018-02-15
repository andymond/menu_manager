class Admin::CommentsController < Admin::BaseController
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
     flash.notice = "Comment deleted."
    else
     flash.notice = "Comment couldn't be deleted."
    end
    redirect_to admin_recipes_path
  end
end
