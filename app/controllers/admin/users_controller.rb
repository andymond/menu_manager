class Admin::UsersController < Admin::BaseController
  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path, notice: "Cook removed from staff."
    else
      redirect_to user_path(@user), notice: "Couldn't remove #{@user.username}"
    end
  end
end
