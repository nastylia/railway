class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def new
  end

  def create
    trains = Search.search_trains(params[:departure_station], params[:arrival_station])
    
    @trains_info = []
    trains.each do |train|
       @trains_info << { train: train, departure: get_station(params[:departure_station]), arrival: get_station(params[:arrival_station]) }
    end
    render :new
  end

  protected

  def get_station(station_id)
    station = RailwayStation.find(station_id)
  end

  def search_params
    params.require(:search).permit(:departure_station, :arrival_station)
  end
end