class SchedulePresenter
  def initialize(schedules)
    @schedules = schedules
  end

  def invoke
    @schedules.map do |schedule|
      {
        start_station:    "#{schedule.start_station.city.name} - #{schedule.start_station.name}",
        start_time:       schedule.start_time,
        end_station:      "#{schedule.end_station.city.name} - #{schedule.end_station.name}",
        end_time:         schedule.end_time,
        carrier:          schedule.carrier.name,
        cost:             "#{schedule.currency.name} #{schedule.total_cost}",
        schedule_by_days: schedule_by_days(schedule.trips.pluck(:start_date)).sort
      }
    end
  end

  private

  def schedule_by_days(trips_dates)
    result = []
    all_dates = (trip_min_date..trip_max_date).group_by(&:wday)
    all_dates.each do |day, dates|
      result << day if (dates & trips_dates).count == all_dates[day].count
    end
    result
  end

  def trip_min_date
    @min_date ||= Trip.min_date
  end

  def trip_max_date
    @max_date ||= Trip.max_date
  end
end