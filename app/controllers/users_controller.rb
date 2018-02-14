class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "#{@user.username}'s account created!"
    else
      flash.now[:notice] = "Account not created due to an error."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id.to_s == params[:id]
      @user = User.find(current_user.id)
    else
      redirect_to user_path(@user), notice: "not found"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash.notice = "#{@user.username} updated."
      redirect_to user_path(@user)
    else
      flash.notice = "User failed to update."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :image)
  end
end
