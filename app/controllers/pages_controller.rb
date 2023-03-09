class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

    if params[:query].present?
      @events = Event.where(title: params[:query])
    else
      @events = Event.all
    end
    # @events = Event.all

    # @markers = @events.geocoded.map do |event|
    #   {
    #     lat: event.latitude,
    #     lng: event.longitude
    #   }
    # end
  end
end
