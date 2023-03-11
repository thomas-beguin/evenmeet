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

  private

  def participation_params
    params.require(:participation).permit(:user_id, :event_id, :hint)
  end
end
