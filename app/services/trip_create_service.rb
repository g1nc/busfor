# frozen_string_literal: true

class TripCreateService < TripBaseService
  def invoke
    create_trip
  end

  private

  def create_trip
    Trip.create(
      start_date: @params[:start_date],
      end_date: @params[:end_date],
      schedule: schedule
    )
  end
end
