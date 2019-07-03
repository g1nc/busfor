class ScheduleController < ApplicationController
  def index
    @schedules = Schedule.eager_load(
      { start_station: :city },
      { end_station: :city },
      :carrier,
      :currency,
      :trips
    ).all
  end
end
