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
      render 'edit'
    end
  end

  def destroy

    Vote.where(:ballot_id => params[:id]).destroy_all
    Ballot.find(params[:id]).destroy
    flash[:success] = "Ballot deleted"
    redirect_to ballots_path
  end

  private

  def ballot_params
    params.require(:ballot).permit(:ballot_name, :candidates, :rank)
  end

end
