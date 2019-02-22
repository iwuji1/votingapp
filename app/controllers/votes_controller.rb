class VotesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:index, :destroy]

  def index
    @user = User.all
    @vot = Vote.all
    @candidates = ["bob box", "susan small", "merry christmas", "why me"]
    @rank = ["1st", "2nd", "3rd", "4th"]
    v5 = []
    sup = []
    count = 0
    @winner = ""
    @loser = 0
    @group = Vote.group(:user_id).group(:candidate_name).group(:rank).order(:user_id).count
    @candidates.each_with_index do |cand, cand_index|
      @user.each_with_index do |us, us_index|
        if @group.key?([us_index,cand_index.to_s,0]) == true
          sup << @group.fetch([us_index,cand_index.to_s,0])
        end
      end
      v5 << sup.sum
      sup = []
    end
    while v5.sum != 0
      if v5.map{|s| s.to_f/v5.sum}.map{|s| s> 0.51}.index(true) != nil
        @winner = @candidates[v5.map{|s| s.to_f/v5.sum}.map{|s| s> 0.51}.index(true)]
        break
      else
        @loser = v5.map{|s| s.to_f/v5.sum}.index(v5.map{|s| s.to_f/v5.sum}.min)
        count = count + 1
        v5[@loser] = 0
        (count..(@rank.length - 1)).each do |r|
          @user.each_with_index do |us, us_index|
            @group.delete([us_index,@loser.to_s,r])
          end
        end
      end
      @candidates.each_with_index do |cand, cand_index|
        @user.each_with_index do |us, us_index|
          if @group.key?([us_index,@loser.to_s,count - 1]) == true
            if @group.key?([us_index,cand_index.to_s,count]) == true
              sup << @group.fetch([us_index,cand_index.to_s,count])
            end
          end
        end
        v5[cand_index] = v5[cand_index] + sup.sum
        sup = []
      end
    end
  end

  def new
    @user = User.find(params[:user_id])
    @vot = Vote.new(params[:votes])
    @candidates = ["bob box", "susan small", "merry christmas", "why me"]
    @rank = ["1st", "2nd", "3rd", "4th"]
  end

  def create
    u = User.find(params[:user_id])
    @top = params[:user_id]
    u.votes.destroy_all
    saved = u.votes
    binding.pry
    if params[:vote]
      params[:vote].each do |selection|
        # selction = JSON.parse(selection)
        cand_name = eval(selection)[:candidate_name]
        rank = eval(selection)[:rank]
        u.votes << Vote.new(candidate_name: cand_name, rank: rank, trial: selection)
        $test << selection
        binding.pry
      end
    end
    $test3[params[:user_id]] = $test
    # u.votes << Vote.new(trial: $test)
    binding.pry
    flash[:success] = "Thank you for voting, stay tuned for results"
    redirect_to(thanks_path)
  end

  private
    def vote_params
      params.require(:vote).permit(:candidate_name[], :rank[], :user_id)
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
