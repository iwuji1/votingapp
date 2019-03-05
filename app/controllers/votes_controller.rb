class VotesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:index, :destroy]

  def index
    @user = User.all
    #@vot = Vote.all
    @vot = Vote.where(:ballot_id => params[:ballot_id])
    @candidates = Ballot.find(params[:ballot_id]).candidates.split(/\W+ /)
    @rank = Ballot.find(params[:ballot_id]).rank.split(/\W+ /)
    #@candidates = ["bob box", "susan small", "merry christmas", "why me"]
    #@rank = ["1st", "2nd", "3rd", "4th"]
  end

  def new
    @user = User.find(params[:user_id])
    @ball = Ballot.find(params[:ballot_id])
    @vot = Vote.new(params[:votes])
    @candidates = @ball.candidates.split(/\W+ /)
    @rank = @ball.rank.split(/\W+ /)

  end

  def create
    
    u = User.find(params[:user_id])
    b = Ballot.find(params[:ballot_id])
    @candidates = b.candidates.split(/\W+ /)
    u.votes.destroy_all
    saved = u.votes

    @candidates.each_with_index do |cand, c_index|
      if params[cand]
        # selction = JSON.parse(selection)
        
        cand_name = c_index
        rank = params[cand].to_i
        u.votes << Vote.new(candidate_name: cand_name, rank: rank, ballot_id: params[:ballot_id])
        b.votes << Vote.new(candidate_name: cand_name, rank: rank, user_id: params[:user_id])
        #$test << selection
      end
        
    end
    #$test3[params[:user_id]] = $test
    # u.votes << Vote.new(trial: $test)

    flash[:success] = "Thank you for voting, stay tuned for results"
    redirect_to(thanks_path)
  end

  private
    def vote_params
      params.require(:vote).permit(:candidate_name[], :rank[], :user_id, :ballot_id)
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
