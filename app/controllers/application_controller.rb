class ApplicationController < ActionController::Base

  protect_from_forgery
  
  private
  
  def current_user
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user #makes current_user method available in the view
  
end
