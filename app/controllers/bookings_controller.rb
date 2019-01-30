class BookingsController < ApplicationController

def new
  #@booking = Booking.new
  @flight = Flight.find(params[:flight_search][:flight])
  @booking = @flight.bookings.build
  @passengers_num = params[:flight_search][:passengers_num].to_i
  @passengers_num.times { @booking.passengers.build }
  
end

def create
  @flight = Flight.find(params[:booking][:flight])
  @booking = @flight.bookings.build(passenger_params)
  @passengers_num = params[:booking][:flight].to_i

  
  if @booking.save
    @booking.passengers.each do |p|
      PassengerMailer.thank_you_email(p).deliver_now
    end
    redirect_to bookings_path
  else
    render 'new'
  end
end

  def index
    @bookings = Booking.all
  end

  private

  

  def passenger_params
    params.require(:booking).permit(passengers_attributes: [:id, :name, :email])
  end



=begin
  def new
    @booking = Booking.new(flight_id: params[:flight_search][:flight])
    @passengers_num = params[:flight_search][:passengers_num].to_i
  end

  def create
    index = 0
    @passengers = []
    @bookings = []
    #original
    #params[:booking][:passengers].each do |passenger|
      #@passengers << Passenger.where(passenger_params(index)).first_or_initialize
      #@bookings << Flight.find(params[:booking][:flight]).bookings.build(passenger: @passengers[index])
      #index += 1
    #endå
    @flight = Flight.find(params[:booking][:flight])
    @booking = @flight.bookings.build
    params[:booking][:passengers].each do |passenger|
      @passengers << Passenger.where(passenger_params(index)).first_or_initialize
      @booking = Flight.find(params[:booking][:flight]).bookings.build(passenger: @passengers[index])
      index += 1
    end
    if @bookings.each(&:save)
      redirect_to 'index'
    else
      render 'new'
    end
  end

  def index
    @bookings = Booking.all
  end

  private

  def passenger_params(index)
    params.require(:booking).require(:passengers).require(index.to_s).permit(:name, :email)
  end
=end
end
