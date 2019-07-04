module ScheduleHelper
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
