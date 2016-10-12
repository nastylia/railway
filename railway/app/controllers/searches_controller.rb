class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def new
  end

  def create
    @departure_station = RailwayStation.find(params[:departure_station])
    @arrival_station = RailwayStation.find(params[:arrival_station])
    @trains = Search.search_trains(@departure_station, @arrival_station)

    render :new
  end

  protected

  def search_params
    params.require(:search).permit(:departure_station, :arrival_station)
  end
end