class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # SessionsHelper
  # before_action :require_user
  # helper_method :current_user

  # def require_user
  #   redirect_to login_path unless current_user
  # end

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   rescue ActiveRecord::RecordNotFound
  # end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
    @current_user
  end

  def the_vote
    if current_user
      "/users/#{@current_user.id}/votes/new"
    end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please Log In"
      redirect_to login_path
    end
  end

  def correct_user
    user = User.find(params[:user_id])
    redirect_to(root_path) unless current_user == user
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin
  end
end
