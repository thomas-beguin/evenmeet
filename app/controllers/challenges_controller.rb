class ChallengesController < ApplicationController
  def show
    @challenge = Challenge.find(params[:id])
    @challenge.read!
    @message = Message.new
  end

  def index
    @challenges = current_user.current_participation.sender_challenges + current_user.current_participation.receiver_challenges
    @events = @challenges.map { |challenge| challenge.reward.event }.uniq.reject { |event| event == current_user.current_event}
  end

  def new
    @challenge = Challenge.new
  end
end
