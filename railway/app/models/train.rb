class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :tickets

  has_many :carriages

  def count_seats(carriages)
    result = {up: 0, down: 0}
    return result unless carriages
    carriages.each do |carriage|
      result[:up] += carriage.up_seats
      result[:down] += carriage.down_seats
    end
    result
  end
end
