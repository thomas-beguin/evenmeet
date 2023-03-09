class ChallengesController < ApplicationController
  def show
    @challenge = Challenge.find(params[:id])
    @message = Message.new
  end

  def index
    @challenges = current_user.current_participation.sender_challenges + current_user.current_participation.receiver_challenges
  end

  def new
    @challenge = Challenge.new
  end
end
