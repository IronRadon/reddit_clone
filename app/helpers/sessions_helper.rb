module SessionsHelper
  def current_user
    User.find_by_session_token(session[:token])
  end

  def logged_in?
    !!current_user
  end

  def login_user(user)
    user.reset_session_token!
    session[:token] = user.session_token
  end

  def authenticate
    redirect_to new_session_url unless logged_in?
  end
end
