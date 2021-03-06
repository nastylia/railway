class TicketsController < ApplicationController
  before_action :authenticate_user!, except: :buy

  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  def index
    @tickets = current_user.admin? ? Ticket.all : current_user.tickets.all
  end

  def show
    @start_station_title = @ticket.start_station.title
    @end_station_title = @ticket.end_station.title
    @train_number = @ticket.train.number
    @departure_time = @ticket.start_station.departure_in(@ticket.train.route)
    @arrival_time = @ticket.start_station.arrival_in(@ticket.train.route)

  end

  def new
    @ticket = current_user.tickets.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      redirect_to search_path
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
    @start_station_id = params[:start_station_id]
    @end_station_id = params[:end_station_id]
    @ticket = Ticket.new(train_id: params[:train_id],
                         start_station_id: params[:start_station_id],
                         end_station_id: params[:end_station_id])
    render :new
  end


  private
  def ticket_params
    params.require(:ticket).permit(:name, :passport_info, :train_id, :start_station_id, :end_station_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end