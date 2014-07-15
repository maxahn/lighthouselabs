class SessionsController < ApplicationController

  def change
    if admin?
      
      if session[:user_id] == session[:admin_id]
        session[:user_id] = params[:id]
        @current_user = User.find(params[:id])
        redirect_to movies_path, notice: "Welcome back, #{@current_user.firstname}!"
      else
        session[:user_id] = session[:admin_id]
        redirect_to admin_users_path
      end
    end
  end

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:admin_id] = user.id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: "Adios!"
  end

end
