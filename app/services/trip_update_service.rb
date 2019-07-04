# frozen_string_literal: true

class TripUpdateService < TripBaseService
  def invoke
    updated = update_trip
    remove_unused_schedules if updated
    updated
  end

  private

  def update_trip
    @trip.update(
      start_date: @params[:start_date],
      end_date: @params[:end_date],
      schedule: schedule
    )
  end
end
