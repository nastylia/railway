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
      @trains_info << { train: train, departure: Search.get_departure_time(train), arrival: Search.get_arrival_time(train) }
    end
    render :new
  end

  protected

  def search_params
    params.require(:search).permit(:departure_station, :arrival_station)
  end
end