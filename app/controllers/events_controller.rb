class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def new
    @event = Event.new
  end
end
