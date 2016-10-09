class Search < ActiveRecord::Base
  def self.search_trains(departure_station, arrival_station)
    routes = Route.where(name: "#{departure_station}-#{arrival_station}").first
    routes.nil? ? [] : routes.trains
  end

  def self.get_departure_time(train)
    train.route.railway_stations_routes.first[:departure_time]
  end

  def self.get_arrival_time(train)
    train.route.railway_stations_routes.last[:arrival_time]
  end
end