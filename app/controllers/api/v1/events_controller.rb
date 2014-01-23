class Api::V1::EventsController < Api::V1::BaseController

  api :GET, '/events/', 'List events'
  def index
    @events = Event.all
    render json: @events
  end

  api :GET, '/events/:id', 'Show event :id'
  param :id, String, desc: 'Event ID', required: true
  def show
    @event = Event.find_by_id params[:id]
    render json: @event
  end

  api :POST, '/events/', 'Create an event'
  param :event, Hash, required: true do
    param :name, String, desc: 'Event name', required: true
    param :description, String, desc: 'Event description'
    param :start_at, String, desc: 'Event datetime start', required: true
    param :end_at, String, desc: 'Event datetime end', required: true
    param :event_type, Event::EVENT_TYPES, desc: 'Event type', required: true
    param :recurrent, Event::RECURRENT_TYPES, desc: 'Event recurrent type'
    param :place, String, desc: 'Event place address'
  end
  def create
    @event = Event.new event_params

    if @event.save
      render json: @event, status: :created
    else
      render json: { error: @event.errors }
    end
  end

  api :PUT, '/events/:id', 'Update an event'
  param :id, String, desc: 'Event ID', required: true
  param :event, Hash, required: true do
    param :name, String, desc: 'Event name', required: true
    param :description, String, desc: 'Event description'
    param :start_at, String, desc: 'Event datetime start', required: true
    param :end_at, String, desc: 'Event datetime end', required: true
    param :event_type, Event::EVENT_TYPES, desc: 'Event type', required: true
    param :recurrent, Event::RECURRENT_TYPES, desc: 'Event recurrent type'
    param :place, String, desc: 'Event place address'
  end
  def update
    @event = Event.find_by_id params[:id]

    if @event && @event.update_attributes(event_params)
      render json: @event
    else
      render json: { error: @event.errors }
    end
  end

  api :DELETE, '/events/:id', 'Delete event :id'
  param :id, String, desc: 'Event ID', required: true
  def destroy
    @event = Event.find_by_id params[:id]

    if @event && @event.update_attribute(:deleted_at, Time.current)
      render nothing: true, status: :no_content
    else
      render_not_found
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_at, :end_at, :event_type, :recurrent, :place)
  end
end
