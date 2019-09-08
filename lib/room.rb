module Hotel
  class Room
    attr_reader :room_number, :room_cost, :reservations
    
    def initialize(room_number, room_cost = 200)
      @room_number = room_number
      @room_cost = room_cost
      @reservations = reservations
    end
  end
end 
# def add_reservation(reservation)
#   @reservations << reservation
# end 


