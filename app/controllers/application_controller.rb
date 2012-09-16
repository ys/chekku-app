class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper_method :current_user

  private
  def authenticate_user!
    unless current_user
      redirect_to new_session_path()
    end
  end


  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
