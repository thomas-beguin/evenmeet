class ChallengesController < ApplicationController
  def show
    @challenge = Challenge.find(params[:id])
    @message = Message.new
  end

  def index
  end

  def new
    @challenge = Challenge.new
  end
end
