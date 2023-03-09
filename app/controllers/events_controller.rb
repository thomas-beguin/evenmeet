class EventsController < ApplicationController

  def index
    @events = Event.all
      if params[:query].present?
        @events = Event.where(title: params[:query])
      else
        @events = Event.all
      end
  end

  def show
    @event = Event.find(params[:id])
    @participations = Participation.all
    @participation = Participation.new
  end

  def new
  end

  def create
  end

  def current
    @event = current_user.current_event
  end

end
