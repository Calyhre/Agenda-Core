class EventsController < ApplicationController
  def index
    @events = Event.all
    render json: @events
  end

  def show
    @event = Event.find_by_id params[:id]
    render json: @event
  end

  def create
    @event = Event.new event_params

    if @event.save
      render json: @event
    else
      render json: { error: @event.errors }
    end
  end

  def destroy
    @event = Event.find_by_id params[:id]

    @event.update_attribute :deleted_at, Time.current
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_at, :end_at, :event_type)
  end
end
