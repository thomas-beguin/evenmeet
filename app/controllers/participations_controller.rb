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

  def radar
    @participations = Participation.all

    @markers = @participations.geocoded.map do |part|
      {
        lat: part.latitude,
        lng: part.longitude,
        marker_html: render_to_string(partial: "marker", locals: { participation: part })
      }
    end
  end

  private

  def participation_params
    params.require(:participation).permit(:user_id, :event_id, :hint)
  end
end
