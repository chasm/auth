class ApplicationController < ActionController::Base
  # protect_from_forgery
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def authorize
    unless current_user
      redirect_to root_url
    end
  end
end
