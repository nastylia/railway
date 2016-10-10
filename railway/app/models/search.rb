class Search

  def self.search_trains(departure_station, arrival_station)
    routes = departure_station.routes & arrival_station.routes
    Train.where(route: routes)
  end
end