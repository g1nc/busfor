class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :schedule
      t.date :start_date
      t.date :end_date
    end
  end
end
