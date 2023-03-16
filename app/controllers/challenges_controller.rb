class ChallengesController < ApplicationController
  def show
    @challenge = Challenge.find(params[:id])
    @challenge.read!
    @message = Message.new

    @participations = Participation.where(id: [@challenge.relationship.sender.id, @challenge.relationship.receiver.id])

    @markers = @participations.geocoded.map do |part|
      {
        lat: part.latitude,
        lng: part.longitude,
        user_id: part.user.id,
        marker_html: render_to_string(partial: "shared/marker", locals: { participation: part })
      }
    end
  end

  def index
    @challenges = current_user.current_participation.sender_challenges + current_user.current_participation.receiver_challenges
    @events = @challenges.map { |challenge| challenge.reward.event }.uniq.reject { |event| event == current_user.current_event}
  end

  def new
    @challenge = Challenge.new
  end
end
