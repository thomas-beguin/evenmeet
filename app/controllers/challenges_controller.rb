class ChallengesController < ApplicationController
  def show
# Chatroom :
    @challenge = Challenge.find(params[:id])
    @challenge.read!
    @message = Message.new
# Radar :
    if @challenge.relationship.receiver.user == current_user
      @target = @challenge.relationship.sender
    else
      @target = @challenge.relationship.receiver
    end
    @markers = [current_user, target] do |player|
      {
        lat: player.latitude,
        lng: player.longitude
      }
    end


  # set lat long pour target via un fetch
  # stocker lat et long dans data attributes sur la view avec method MapBox
  end

  def index
    @challenges = current_user.current_participation.sender_challenges + current_user.current_participation.receiver_challenges
    @events = @challenges.map { |challenge| challenge.reward.event }.uniq.reject { |event| event == current_user.current_event}
  end

  def new
    @challenge = Challenge.new
  end
end
