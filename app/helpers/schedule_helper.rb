module ScheduleHelper
  def schedule_by_days(trips)
    result = []
    @min_date ||= Trip.min_date
    @max_date ||= Trip.max_date
    all_dates = (@min_date..@max_date).group_by(&:wday)
    all_dates.each do |day, dates|
      result << day if dates.all? { |date| trips.to_a.select { |trip| trip[:start_date] == date }.present? }
    end
    result
  end
end
