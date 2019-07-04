# frozen_string_literal: true

class TripsController < ApplicationController
  before_action :fetch_trip, only: %i[edit update destroy]
  before_action :fetch_select_data, only: %i[new edit]

  def index
    trips = TripQuery.new.items
    @trips = TripPresenter.new(trips).invoke
  end

  def new; end

  def create
    if TripCreateService.new(params: params).invoke
      redirect_to trips_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if TripUpdateService.new(params: params, trip: @trip).invoke
      redirect_to trips_path
    else
      render :edit
    end
  end

  def destroy
    TripDestroyService.new(trip: @trip).invoke
    redirect_to trips_path
  end

  private

  def fetch_trip
    @trip = TripQuery.new.item(params[:id])
  end

  def fetch_select_data
    @stations   = Station.eager_load(:city).all
    @carriers   = Carrier.all
    @currencies = Currency.all
  end
end
