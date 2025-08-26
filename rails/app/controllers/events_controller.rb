class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def index
    # Start with base scope - live, public, browsable events
    @events = Event.live.public.browsable
    
    # Date filtering
    @from = params[:from] ? parse_date(params[:from]) : 1.month.ago
    @to = params[:to] ? parse_date(params[:to]) : nil
    
    # Text search across multiple fields
    if params[:search].present?
      @events = @events.and(:id.in => search_events(params[:search]).pluck(:id))
    end
    
    # Online/In-person filtering
    unless params[:online] && params[:in_person]
      @events = @events.online if params[:online] == "1"
      @events = @events.in_person if params[:in_person] == "1"
    end
    
    # Apply date range filtering
    @events = @events.future(@from)
    @events = @events.and(:start_time.lt => @to + 1) if @to
    
    # Ordering
    @events = case params[:order]
              when 'created_at'
                @events.order('created_at desc')
              else
                @events.order('start_time asc')
              end
  end

  def show
  end  

  private

  def search_events(query)
    # Comprehensive search across multiple fields
    Event.where('$or' => [
                  { name: /#{Regexp.escape(query)}/i },
                  { description: /#{Regexp.escape(query)}/i },
                  { location: /#{Regexp.escape(query)}/i }
                ])
  end

  def parse_date(date_string)
    return nil if date_string.blank?
    
    begin
      Date.parse(date_string)
    rescue ArgumentError
      nil
    end
  end

  def set_event
    @event = Event.fs(params[:slug])
  end
end
