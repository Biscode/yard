class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 before_action :authenticate_user!
  protect_from_forgery with: :exception

  helper_method :current_user

 def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end
end
