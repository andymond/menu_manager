class Admin::UsersController < Admin::BaseController
  def edit
    @user = User.find(params[:id])
  end

end
