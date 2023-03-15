class ChallengeChannel < ApplicationCable::Channel
  def subscribed
    challenge = Challenge.find(params[:id])
    stream_for challenge
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    console.log("Unsubscribed from the challenge")
    this.channel.unsubscribe
  end
end
