require 'wikipedia'

class EventsController < ApplicationController
  # add pundit
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @page = Wikipedia.find( 'Getting Things Done' )
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  private

  def event_params
    params.require(:event).permit(:name, :content, :year, :summary)
  end
end
