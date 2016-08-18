class Fe::EventsController < ApplicationController
  def index
    @events = Event.all.order(updated_at: :desc)
    @active_block = Block.find_by_name("Events-опт")
  end

  def show
    @event = Event.find(params[:id])
    @active_block = Block.find_by_name("Events-опт")
  end
end
