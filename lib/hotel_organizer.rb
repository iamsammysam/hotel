require "pry"

module Hotel
  class HotelOrganizer
    attr_reader :reservations, :rooms
    
    def initialize
      @reservations = []
      @rooms = []
      
      20.times.each do |i|
        @rooms << Hotel::Room.new(i + 1)
      end
    end
    
    def list_rooms
      @rooms
    end
    
    def make_reservation(reservation_id, room_number, start_date, end_date)  
      reservation_id = (reservations.length + 1)
      room = find_room(room_number)
      
      reservation = Hotel::Reservation.new(reservation_id, room, start_date, end_date)
      return reservation
    end
    
    def add_reservation(reservation)
      @reservations << reservation
    end 
    
    def list_reservations(date)
      reservations_by_date = []
      
      @reservations.each do |reservation|
        if reservation.start_date == date
          reservations_by_date << reservation
          return reservations_by_date
        end 
      end 
      return nil
    end
    
    private
    
    def find_room(room_number)
      rooms.each do |room|
        if room.room_number == room_number
          return room
        end
      end
      
      return nil
    end
  end
end 
