class ApplicationController < ActionController::Base
  # TODO: protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  def login!(user)
    @current_user = user
    session[:token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:token] = nil
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:token])
  end

  def logged_in?
    !!current_user
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
