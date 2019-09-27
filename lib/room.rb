module Hotel
  class Room
    attr_reader :room_number, :room_cost, :reservations
    
    def initialize(room_number, room_cost = 200, reservations = [])
      @room_number = room_number
      @room_cost = room_cost
      @reservations = reservations
    end
    
    def add_reservation(reservation)
      @reservations << reservation
    end 
    
    #put method room_available here for refactoring?!
  end 
end 
