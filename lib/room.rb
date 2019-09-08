module Hotel
  class Room
    attr_reader :room_number, :room_cost
    
    def initialize(room_number, room_cost = 200)
      @room_number = room_number
      @room_cost = room_cost
    end
  end 
end
