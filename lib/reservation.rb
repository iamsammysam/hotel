module Hotel
  class Reservation
    attr_reader :reservation_id, :room, :start_date, :end_date
    
    def initialize(reservation_id, room, start_date, end_date)
      @reservation_id = reservation_id
      @room = room
      @room_cost = 200
      
      if start_date != nil && end_date !=nil
        if end_date < start_date
          raise ArgumentError, "#{end_date} is before #{start_date}."
        end
        
        @start_date = start_date
        @end_date = end_date
      end
    end
    
    def total_cost
      return duration * (@room_cost)
    end
    
    def duration
      return (end_date - start_date).to_i
    end
  end
end
