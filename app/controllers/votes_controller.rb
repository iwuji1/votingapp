class VotesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:index, :destroy]

  def index
    binding.pry
    @user = User.all
    @vot = Vote.all
    @candidates = ["bob box", "susan small", "merry christmas", "why me"]
    @rank = ["1st", "2nd", "3rd", "4th"]
  end

  def new
    @user = User.find(params[:user_id])
    @ball = Ballot.find(params[:ballot_id])
    @vot = Vote.new(params[:votes])
    @candidates = @ball.candidates.split(/\W+/)
    @rank = @ball.rank.split(/\W+/)
    binding.pry
  end

  def create
    u = User.find(params[:user_id])
    b = Ballot.find(params[:ballot_id])
    u.votes.destroy_all
    saved = u.votes
    binding.pry
    if params[:vote]
      params[:vote].each do |selection|
        # selction = JSON.parse(selection)
        binding.pry
        cand_name = eval(selection)[:candidate_name]
        rank = eval(selection)[:rank]
        u.votes << Vote.new(candidate_name: cand_name, rank: rank, trial: selection)
        #$test << selection
        binding.pry
      end
    end
    #$test3[params[:user_id]] = $test
    # u.votes << Vote.new(trial: $test)
    binding.pry
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
