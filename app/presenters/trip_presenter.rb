# frozen_string_literal: true

class TripPresenter
  def initialize(trips)
    @trips = trips
  end

  def invoke
    @trips.map do |trip|
      {
        id: trip.id,
        start_station: "#{trip.schedule.start_station.city.name} - #{trip.schedule.start_station.name}",
        start_date_time: "#{trip.start_date} #{trip.schedule.start_time}",
        end_station: "#{trip.schedule.end_station.city.name} - #{trip.schedule.end_station.name}",
        end_date_time: "#{trip.end_date} #{trip.schedule.end_time}",
        carrier: trip.schedule.carrier.name,
        cost: "#{trip.schedule.currency.name} #{trip.schedule.total_cost}"
      }
    end
  end
end
