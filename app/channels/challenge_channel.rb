class ChallengeChannel < ApplicationCable::Channel
  def subscribed
    challenge = Challenge.find(params[:id])
    stream_for challenge
  end

  # def unsubscribed
  #   channel.unsubscribe
  # end
end
