# frozen_string_literal: true

class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.references :city
      t.string :name
    end
  end
end
