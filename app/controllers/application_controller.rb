class ApplicationController < ActionController::Base


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user, :get_users



  def current_user
    # the user_id is crucial because regular :id won't work
    @current_user ||= User.find_by_id(session[:user_id])
  end


  def get_users
    @users = User.all
    # binding.pry
  end


end
