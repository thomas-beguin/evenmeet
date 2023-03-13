class RewardsController < ApplicationController

  def show
    @challenge = Challenge.find(params[:id])
  end

  def qrcode
    @challenge = Challenge.find(params[:id])
    @target_id = params[:target_id]
    @user = current_user.id
    @relationship = @challenge.relationship
    @rel_sender = @challenge.relationship.sender_id
    @rel_receiver = @challenge.relationship.receiver_id
    @id_sender = Participation.find(@rel_sender).user_id
    @id_receiver = Participation.find(@rel_receiver).user_id

    if @user == @id_sender
      @target_id == @id_receiver ? @challenge.status = 0 : @challenge.status = 1
      @challenge.save
      @test = 1
      redirect_to reward_path
    elsif @user == @id_receiver
      @target_id == @id_sender ? @challenge.status = 0 : @challenge.status = 1
      @challenge.save
      @test = 2
      redirect_to reward_path
    end
    console
  end

end
