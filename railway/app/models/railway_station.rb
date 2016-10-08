class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  has_many :trains, foreign_key: :current_station_id

  has_many :tickets_departure, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :tickets_arrival, class_name: 'Ticket', foreign_key: :end_station_id

  scope :ordered, -> { joins(:railway_stations_routes).distinct.order("railway_stations_routes.position ASC")}
  def update_position(route, position_number)
    station_route = station_route(route)
    station_route.update(position: position_number) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
