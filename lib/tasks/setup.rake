# frozen_string_literal: true

require 'rubygems/package'
require 'zlib'

namespace :setup do
  task initialize_data: :environment do
    tar_extract = Gem::Package::TarReader.new(Zlib::GzipReader.open(Rails.root.join('trips.tar.gz')))
    tar_extract.rewind
    tar_extract.each do |entry|
      next unless entry.file?

      trips = YAML.load(entry.read)
      trips.each do |trip|
        start_city    = City.find_or_create_by(name: trip[:start_city_name])
        end_city      = City.find_or_create_by(name: trip[:end_city_name])
        start_station = Station.find_or_create_by(name: trip[:station_begin_name], city: start_city)
        end_station   = Station.find_or_create_by(name: trip[:station_end_name], city: end_city)
        carrier       = Carrier.find_or_create_by(name: trip[:carrier_name])
        currency      = Currency.find_or_create_by(name: trip[:currency])

        schedule = Schedule.find_or_create_by(
          start_station: start_station,
          end_station: end_station,
          carrier: carrier,
          total_cost: trip[:total_cost],
          currency: currency,
          start_time: trip[:start_time],
          end_time: trip[:end_time]
        )

        Trip.create(
          schedule: schedule,
          start_date: Date.parse(trip[:start_date]),
          end_date: Date.parse(trip[:end_date])
        )
      end
    end
    tar_extract.close
  end
end
