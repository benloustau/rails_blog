class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.where(email: params[:email])
    if @user and @user.password == params[:password]
      session[:user_id] = @user.user_id
      flash[:notice] = "Logged in!"
      redirect_to users_path
    else
      flash[:alert] = "There was a problem logging you in."
      redirect_to new_sesson_path
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    session[:user_id] = nil
    redirect_to @user_id
  end
  
end