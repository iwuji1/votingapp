class VotesController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :edit, :update, :destroy]
  before_action :correct_user, only: [:new, :edit, :update]
  before_action :admin_user, only: [:index, :new, :edit, :update, :destroy]

  def index
    @user = User.all
    @vot = Vote.where(:ballot_id => params[:ballot_id])
    @candidates = Ballot.find(params[:ballot_id]).candidates.split(/\W+ /)
    @rank = Ballot.find(params[:ballot_id]).rank.split(/\W+ /)
  end

  def new
    @user = User.find(params[:user_id])
    @ball = Ballot.all
  end

  def massform
    @user = User.find(params[:format])
    @ball = Ballot.all
  end

  def create
    u = User.find(params[:user_id])
    u.votes.destroy_all

    @ball = Ballot.all.each do |b|
      @candidates = b.candidates.split(/\W+ /)
      @candidates.each_with_index do |cand, c_index|
        if params[cand]
          cand_name = c_index
          rank = params[cand].to_i
          u.votes << Vote.new(candidate_name: cand_name, rank: rank, ballot_id: b.id)
        end
      end
    end

    flash[:success] = "Thank you for voting, stay tuned for results"
    redirect_to(thanks_path)
  end

  private

  def vote_params
    params.require(:vote).permit(:candidate_name[], :rank[], :user_id, :ballot_id)
  end
end
