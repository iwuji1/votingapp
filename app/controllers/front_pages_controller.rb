class FrontPagesController < ApplicationController
  def home
  end

  def help
  end

  def vote
    @candidate = Candidate.all
    @options = Option.all
  end
end
