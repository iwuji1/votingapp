class BallotsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def show
    @vot = Vote.all
    @ball = Ballot.find(params[:id])
    @user = User.find(params[:id])
  end

  def index
    @ball = Ballot.all
  end

  def new
    @ball = Ballot.new
  end

  def create
    binding.pry
    @ball = Ballot.new(ballot_params)
    if @ball.save

    redirect_to ballot_path(@ball)
    else
      render 'new'
    end
  end

  def update
    @ball = Ballot.find(params[:id])
    if @ball.update_attributes(ballot_params)
      flash[:success] = "Profile updated"
      redirect_to @ball
    else
      render'edit'
    end
  end

  private
    def ballot_params
      params.require(:ballot).permit(:ballot_name, :candidates, :rank)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please Log In"
        redirect_to login_path
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
