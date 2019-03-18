class SessionsController < ApplicationController
  # skip_before_action :logged_in?

  def new
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to new_user_vote_path(user.id)
  end

  def destroy
    #log_out if logged_in?
    session[:user_id] = nil
    redirect_to root_path
  end
end
