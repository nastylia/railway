class AddIndexesToClasses < ActiveRecord::Migration[5.0]
  def change
    add_index :railway_stations_routes, :railway_station_id
    add_index :railway_stations_routes, :route_id
    add_index :tickets, :train_id
    add_index :tickets, :user_id
    add_index :tickets, :start_station_id
    add_index :tickets, :end_station_id
    add_index :trains, :route_id
    add_index :trains, :current_station_id

    add_index :carriages, [:id, :type]
  end
end
