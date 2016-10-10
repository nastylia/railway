class Search < ActiveRecord::Base

  def self.search_trains(departure_station_id, arrival_station_id)
    routes_departure = RailwayStation.find(departure_station_id).routes
    routes_arrival = RailwayStation.find(arrival_station_id).routes
    routes = routes_departure & routes_arrival
    trains = []
    routes.each { |route| route.trains.each {|t| trains << t}}
    trains
  end

  def self.get_station(station_id)
    station = RailwayStation.find(station_id)
  end
end