class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @events = Event.all
    if params[:query].present?
      params[:geo] = ""
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @events = Event.where(sql_query, query: "%#{params[:query]}%")
    elsif params[:geo].present?
      params[:query] = ""
      @events = Event.near(params[:geo])
    end
    # @events = Event.all
    # @markers = @events.geocoded.map do |event|
    #   {
    #     lat: event.latitude,
    #     lng: event.longitude
    #   }
    # # end
    # if params[:query].present?
    #   @events = Event.where(title: params[:query])
    # else
    #   @events = Event.all
    # end
    @participations = Participation.all
    @participation = Participation.new
  end
end
