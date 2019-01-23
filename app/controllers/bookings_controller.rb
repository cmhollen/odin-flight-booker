class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: params[:flight][:flight])
    @passengers_num = params[:flight][:passengers_num].to_i
    #params[:flight][:passengers_num].to_i.times do
      #@booking.passenger.build
    #end
  end

  def create
    index = 0
    @passengers = []
    @bookings = []
    params[:booking][:passengers].each do |passenger|
      @passengers << Passenger.where(passenger_params(index)).first_or_initialize
      @bookings << Flight.find(params[:booking][:flight]).bookings.build(passenger: @passengers[index])
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
end
