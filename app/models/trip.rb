class Trip < ApplicationRecord
  belongs_to :schedule

  def self.max_date
    max(start_date)
  end

  def self.min_date
    min(start_date)
  end
end
