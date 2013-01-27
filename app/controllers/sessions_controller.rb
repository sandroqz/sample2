class SessionsController < ApplicationController
  def new
  end

  def create
    username = params[:username]
    password = params[:password]
    user = User.login(username, password)
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to new_sessions_path, :alert => "Invalid login or password"
    end
  end

  def destroy
    session.reset!
    redirect_to new_sessions_path
  end

end
