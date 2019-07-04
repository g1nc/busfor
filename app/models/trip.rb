# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :schedule

  def self.max_date
    maximum(:start_date)
  end

  def self.min_date
    minimum(:start_date)
  end
end
