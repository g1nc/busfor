class ScheduleQuery
  def initialize(start_city: nil, end_city: nil)
    @start_city = start_city
    @end_city   = end_city
  end

  def items
    schedules = Schedule.eager_load(
      { start_station: :city },
      { end_station: :city },
      :carrier,
      :currency,
      :trips
    )
    schedules = schedules.where(start_station: city_stations(@start_city)) if @start_city.present?
    schedules = schedules.where(end_station: city_stations(@end_city))     if @end_city.present?
    schedules
  end

  private

  def city_stations(city_id)
    Station.where(city_id: city_id).pluck(:id)
  end
end