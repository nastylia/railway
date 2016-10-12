class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show]
  before_action :set_train, only: [:new, :create]

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
      redirect_to @train
    else
      render :new
    end
  end

  protected

  def carriage_params
    params.require(:carriage).permit(:type, :carriage_type, :up_seats, :down_seats, :train_id, :sit_seats, :side_up_seats, :side_down_seats)
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end