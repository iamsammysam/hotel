module Hotel
  class Reservation
    attr_reader :reservation_id, :room, :start_date, :end_date
    
    def initialize(reservation_id, room, start_date, end_date)
      @reservation_id = reservation_id
      @room = room
      
      if start_date != nil && end_date !=nil
        if end_date < start_date
          raise ArgumentError, "#{end_date} is before #{start_date}."
        end
        
        @start_date = start_date
        @end_date = end_date
      end
    end
  end
end
