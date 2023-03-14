class ParticipationsController < ApplicationController

  def new
    @participation = Participation.new
  end

  def create
    @event = Event.find(params[:event_id])
    @participation = Participation.new(participation_params)
    @participation.event = @event
    @participation.user = current_user
    if @participation.save
      redirect_to root_path
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  def index
    @participations = current_user.participations.joins(:event).merge(Event.order(start_date: :asc))
  end

  def update
    @challenge = Challenge.find(params["challenge-id"])

    # {"lon"=>2.3764895, "lat"=>48.863464, "id"=>"210", "participation"=>{}}
    @participation = Participation.find(params[:id])
    @participation.update_attribute(:latitude, params[:lat])
    @participation.update_attribute(:longitude, params[:lng])
    @participations = Participation.where(id: [@challenge.relationship.sender.id, @challenge.relationship.receiver.id])

    @markers = @participations.geocoded.map do |part|
      {
        lat: part.latitude,
        lng: part.longitude,
        marker_html: render_to_string(partial: "shared/marker", locals: { participation: part })
      }
    end

    ChallengeChannel.broadcast_to(
      @challenge,
      { markers: @markers }
    )

    respond_to do |format|
      format.json { render(json: { markers: @markers }) }
      format.html { redirect_to root_path, status: :see_other, notice: "" }
    end
  end

  private

  def participation_params
    params.require(:participation).permit(:user_id, :event_id, :hint, :longitude, :latitude)
  end
end
