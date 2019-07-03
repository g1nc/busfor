class Schedule < ApplicationRecord
  belongs_to :start_station, class_name: 'Station', foreign_key: 'start_station_id'
  belongs_to :end_station, class_name: 'Station', foreign_key: 'end_station_id'
  belongs_to :carrier
  belongs_to :currency
  has_many   :trips

  def by_days
    result = []
    all_dates = (Trip.min_date..Trip.max_date).group_by(&:wday)
    all_dates.each do |day, dates|
      result << day if dates.all? { |date| trips.where(start_date: date).present? }
    end
    result
  end
end
