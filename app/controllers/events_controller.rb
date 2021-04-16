class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :title, :image, :category_id, :comment, :event_datetime, :meeting_time, :place_id, :price, :bring, :deadline_datetime, :capacity
    ).merge(user_id: current_user.id)
  end
end
