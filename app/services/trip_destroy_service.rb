# frozen_string_literal: true

class TripDestroyService < TripBaseService
  def invoke
    destroyed = @trip.destroy
    remove_unused_schedules if destroyed
    destroyed
  end
end
