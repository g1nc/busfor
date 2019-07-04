class ScheduleController < ApplicationController
  def index
    schedules = Schedule.eager_load(
      { start_station: :city },
      { end_station: :city },
      :carrier,
      :currency,
      :trips
    )

    schedules = schedules.where(start_station: City.find(params[:start_city]).stations.pluck(:id)) if params[:start_city].present?
    schedules = schedules.where(end_station: City.find(params[:end_city]).stations.pluck(:id)) if params[:start_city].present?

    @schedules = SchedulePresenter.new(schedules).invoke
  end
end
