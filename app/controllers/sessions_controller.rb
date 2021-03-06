class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:notice] = "Login failed."
      render :new
    end
  end

  def destroy
    session.clear
    @current_user = nil

    redirect_to root_path, notice: "Logged out."
  end

end
