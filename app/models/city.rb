# frozen_string_literal: true

class City < ApplicationRecord
  has_many :stations
end
