# Revisiting Hotel:
# What is this class's responsibility?
# You should be able to describe it in a single sentence.
# Is this class responsible for exactly one thing?
# Does this class take on any responsibility that should be delegated to "lower level" classes?
# Is there code in other classes that directly manipulates this class's instance variables?

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
  end 
end 
