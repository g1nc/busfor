class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :start_station
      t.references :end_station
      t.references :carrier
      t.references :currency
      t.string :start_time
      t.string :end_time
      t.float :total_cost
      t.timestamps
    end
  end
end
