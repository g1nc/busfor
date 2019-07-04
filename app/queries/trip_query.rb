# frozen_string_literal: true

class TripQuery
  def initialize
    @items = Trip.eager_load(
      schedule: [
        { end_station: :city },
        { start_station: :city },
        :carrier,
        :currency
      ]
    )
  end

  def items
    @items.all
  end

  def item(id)
    @items.find(id)
  end
end
