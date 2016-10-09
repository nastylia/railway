class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  def index
    @tickets = Ticket.all
  end

  def show
    @start_station_title = @ticket.start_station.title
    @end_station_title = @ticket.end_station.title
    @train_number = @ticket.train.number
    @departure_time = Search.get_departure_time(@ticket.train)
    @arrival_time = Search.get_arrival_time(@ticket.train)

  end

  def new
    render :create
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  def buy
    @train = Train.find(params[:id])
    @users = User.all
    @start_station_id = params[:start_station_id]
    @end_station_id = params[:end_station_id]
    @ticket = Ticket.new(train_id: params[:train_id],
                         start_station_id: params[:start_station_id],
                         end_station_id: params[:end_station_id])
    render :new
  end


  private
  def ticket_params
    params.require(:ticket).permit(:name, :passport_info, :user_id, :train_id, :start_station_id, :end_station_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end