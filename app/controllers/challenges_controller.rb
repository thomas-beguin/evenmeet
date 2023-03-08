class ChallengesController < ApplicationController
  def show
    @chatroom = Challenge.find(params[:id])
    @message = Message.new
  end

  def index
  end
end
