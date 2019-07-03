class TripsController < ApplicationController
  def index
    @trips = Trip.eager_load(schedule: [{ end_station: :city }, { start_station: :city }, :carrier, :currency]).all
  end
end
