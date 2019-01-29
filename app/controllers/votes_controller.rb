class VotesController < ApplicationController
  def index
    @user = User.all
    @vot = Vote.all
    @candidates = ["bob box", "susan small", "merry christmas", "why me"]
    @rank = ["1st", "2nd", "3rd", "4th"]
  end

  def new
    @user = User.find(params[:user_id])
    @vot = Vote.new(params[:votes])
    @candidates = ["bob box", "susan small", "merry christmas", "why me"]
    @rank = ["1st", "2nd", "3rd", "4th"]
  end

  def create
    u = User.find(params[:user_id])
    u.votes.destroy_all
    saved = u.votes
    if params[:vote]
      params[:vote].each do |selection|
        cand_name = eval(selection)[:cand_name]
        rank = eval(selection)[:rank]
        u.votes << Vote.new(candidate_name: cand_name, rank: rank)
      end
    end
    flash[:success] = "Welcome to voting app,get ready to vote!"
    redirect_to(login_path)
  end

  private
    def vote_params
      params.require(:vote).permit(:candidate_name, :rank, :user_id)
    end
end
