class FrontPagesController < ApplicationController
  def home
  end

  def help
  end

  def thankyou
  end

  def massform
    binding.pry
    @user = User.find(params[:user_id])
    @ball = Ballot.all
  end
end
