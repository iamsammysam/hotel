module Hotel
  class Reservation
    attr_reader :room, :start_date, :end_date, :range
    
    def initialize(room, start_date, end_date, date_range)
      @room = room
      if start_date != nil && end_date !=nil
        if end_date < start_date
          raise ArgumentError, "#{end_date} is before #{start_date}."
        end
      end 
      
      if start_date == nil || end_date == nil
        raise ArgumentError, "#{start_date} or #{end_date} are invalid."
      end
      
      @start_date = start_date
      @end_date = end_date
      @date_range = date_range
    end
    
    def date_range
      (start_date..end_date).to_a
    end 
    
    def total_cost
      return duration * (room.room_cost)
    end
    
    def duration
      return (end_date - start_date).to_i
    end
  end
end
