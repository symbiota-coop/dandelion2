class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def index
    @events = Event.all.order(start_time: :desc)
  end

  def show
  end

  private

  def set_event
    @event = Event.fs(params[:slug])
  end
end
