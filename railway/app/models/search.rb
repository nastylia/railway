class Search < ActiveRecord::Base

  #attr_accessor :departure_station_id, :arrival_station_id

  def self.search_trains(departure_station_id, arrival_station_id)
    routes_departure = RailwayStation.find(departure_station_id).routes
    routes_arrival = RailwayStation.find(arrival_station_id).routes
    routes = routes_departure & routes_arrival
    trains = []
    routes.each { |route| route.trains.each {|t| trains << t}}
    trains
  end

  # def departure_station
  #   @start_station ||= RailwayStation.find(departure_station_id)
  # end

  # def arrival_station
  #   @end_station ||= RailwayStation.find(arrival_station_id)
  # end
end