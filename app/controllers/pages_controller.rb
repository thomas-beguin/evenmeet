class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

    if params[:query].present?
      @events = Event.where(title: params[:query])
    else
      @events = Event.all
    end
    
    @participations = Participation.all
    @participation = Participation.new
  end
end
