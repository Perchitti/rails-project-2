class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  #before_action :authenticate

  #def authenticate
  #  redirect_to :login unless logged_in?
  #end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end
end
