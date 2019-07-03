class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :start_station
      t.references :end_station
      t.date :start_date
      t.string :start_time
      t.date :end_date
      t.string :end_time
      t.references :carrier
      t.float :total_cost
      t.references :currency
    end
  end
end
