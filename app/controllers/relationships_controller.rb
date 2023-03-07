class RelationshipsController < ApplicationController
  def new
    @participations = Participation.all
    @users = User.all
  end

  def create
    target_participation = Participation.find(params[:id])
    current_participation = current_user.participations.where(id: params[:event_id]).first

    find_or_create_match
    binding.pry


    if liked?
      @relation.accepted! 
    else
      @relation.refused!
    end

    respond_to do |format|
      format.json { render partial: "shared/swiper", locals: { users: @users }, formats: [:html] }
      format.html { redirect_to  }
    end
  end

  private

  def find_or_create_match
    current_participation.sender_relationships.each do |sender|
      if sender == target_participation
        # match existe déjà
        # alors on change le statut du match
      else
        # On initialise le match
        @relation = Relation.new
        @relation.sender   = current_participation
        @relation.receiver = target_participation
        @relation.save
      end
    end
  end

  def liked?
    params[:liked] == 'true'
  end
end
