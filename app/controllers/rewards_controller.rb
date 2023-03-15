class RewardsController < ApplicationController

  def show
    @challenge = Challenge.find(params[:id])
  end

  def qrcode
    @challenge = Challenge.find(params[:id])
    @target_id = params[:target_id].to_i
    @user = current_user.id
    @sender = Participation.find(@challenge.relationship.sender_id).user_id
    @receiver = Participation.find(@challenge.relationship.receiver_id).user_id
    if @user == @sender
      @challenge.won! if @target_id == @receiver
      @test = 1
      redirect_to reward_path, status: :see_other
    elsif @user == @receiver
      @challenge.won! if @target_id == @sender
      @test = 2
      redirect_to reward_path, status: :see_other
    end
  end

  def scan
    @challenge = Challenge.find(params[:id])
  end

end
