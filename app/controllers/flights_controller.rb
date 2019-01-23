class FlightsController < ApplicationController
    def index
        @flight = Flight.new(flight_params)
        @airport_codes = Airport.all.map{ |a| [a.code, a.id] } 
        @date_options = Flight.select(:date).group(:date).map{ |d| d.date }
        unless params[:flight].nil?
          @results = Flight.where(departure_airport: params[:flight][:departure_airport_id], 
                                  arrival_airport: params[:flight][:arrival_airport_id], 
                                  date: params[:flight][:date])
        end
        
    end

    private
    
    def flight_params
        params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :date)
    end

end
