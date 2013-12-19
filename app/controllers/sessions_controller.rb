class SessionsController < ApplicationController
  include SessionsHelper
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(*params[:user].values)

    if @user.nil?
      flash[:errors] = ["Invalid username/password combination! :("]
      redirect_to new_session_url
    else
      login_user(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:token] = nil
    redirect_to new_session_url
  end
end
