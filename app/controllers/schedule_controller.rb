class ScheduleController < ApplicationController
  def index
    schedules_query = ScheduleQuery.new(
      start_city: params[:start_city],
      end_city:   params[:end_city]
    )
    @schedules = SchedulePresenter.new(schedules_query.items).invoke
  end
end
