# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.create(code: "ORD")
Airport.create(code: "MCO")
Airport.create(code: "STL")
Airport.create(code: "JFK")
Airport.create(code: "SFO")
Airport.create(code: "TPA")

Flight.create(departure_airport_id: 1, arrival_airport_id: 2, departure_time: 5.hours.since)
Flight.create(departure_airport_id: 5, arrival_airport_id: 4, departure_time: 12.hours.since)
Flight.create(departure_airport_id: 3, arrival_airport_id: 6, departure_time: 2.days.since)
Flight.create(departure_airport_id: 3, arrival_airport_id: 2, departure_time: 7.days.since)
Flight.create(departure_airport_id: 4, arrival_airport_id: 5, departure_time: 2.hours.since)
Flight.create(departure_airport_id: 1, arrival_airport_id: 6, departure_time: 3.days.since)
Flight.create(departure_airport_id: 6, arrival_airport_id: 1, departure_time: 7.hours.since)
Flight.create(departure_airport_id: 2, arrival_airport_id: 3, departure_time: 8.hours.since)
Flight.create(departure_airport_id: 3, arrival_airport_id: 6, departure_time: 3.hours.since)
Flight.create(departure_airport_id: 3, arrival_airport_id: 2, departure_time: 2.hours.since)