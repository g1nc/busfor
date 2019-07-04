# frozen_string_literal: true

class TripBaseService
  def initialize(params: nil, trip: nil)
    @params = params
    @trip   = trip
  end

  protected

  def schedule
    Schedule.find_or_create_by(
      start_station: start_station,
      end_station: end_station,
      carrier: carrier,
      total_cost: @params[:cost],
      currency: currency,
      start_time: @params[:start_time],
      end_time: @params[:end_time]
    )
  end

  def start_station
    Station.find(@params[:start_station])
  end

  def end_station
    Station.find(@params[:end_station])
  end

  def carrier
    Carrier.find(@params[:carrier])
  end

  def currency
    Currency.find(@params[:currency])
  end

  def remove_unused_schedules
    Schedule.joins(:trips).group('schedules.id').having('count(trips.id) = 0').destroy_all
  end
end
