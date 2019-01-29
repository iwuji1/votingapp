class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @candidates = ["bob box", "susan small", "merry christmas", "why me"]
    @rank = ["1st", "2nd", "3rd", "4th"]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to voting app,get ready to vote!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
