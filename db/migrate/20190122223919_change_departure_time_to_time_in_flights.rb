class ChangeDepartureTimeToTimeInFlights < ActiveRecord::Migration[5.2]
  def change
    change_column :flights, :departure_time, :time
  end
end
