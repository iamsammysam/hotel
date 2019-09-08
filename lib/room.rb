require "pry"

module Hotel
  class Room
    attr_reader :room_number, :room_cost, :reservations
    
    def initialize(room_number, room_cost = 200)
      @room_number = room_number
      @room_cost = room_cost
      @reservations = reservations
    end
    
    def add_reservation(reservation)
      @reservations << reservation
    end 
    
    def room_status(start_date, end_date)
      room_booked_dates = []
      
      @reservations.each do |reservation|
        duration = (reservation.end_date - reservation_start_date).to_i
        
        duration.times do |i|
          date = reservation.start_date + i
          room_booked_dates << date
        end
      end
      
      return room_booked_dates
    end 
  end 
end
