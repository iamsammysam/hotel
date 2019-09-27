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
    
    def total_rooms
      return @rooms
    end
    
    # Wave 1 - make reservation for date range
    def make_reservation(start_date, end_date, date_range)  
      avai_room = list_available_rooms(start_date, end_date).sample
      
      reservation = Hotel::Reservation.new(avai_room, start_date, end_date, date_range)
      @reservations << reservation
      
      # binding.pry
      return reservation
    end
    
    # Wave 1 - list of reservations by date
    def list_reservations(date)
      reservations_by_date = []
      
      @reservations.each do |reservation|
        if reservation.date_range.include?(date)
          reservations_by_date << reservation
        end 
      end
      
      if reservations_by_date.empty?
        raise ArgumentError, "No reservations for this date."
      end
      # binding.pry - ok
      return reservations_by_date
    end
    
    # Wave 2: rooms available by date range
    def rooms_available?(room, start_date, end_date)            
      reservations.each do |reservation|
        
        while start_date != end_date
          if reservation.date_range.include?(start_date)
            return false
          else
            start_date += 1
          end
        end  
        
        #binding.pry
        return true
      end
    end 
    
    def list_available_rooms(start_date, end_date)
      available_rooms = []
      
      rooms.each do |room|
        if rooms_available?(room, start_date, end_date)
          available_rooms << room
        end 
      end 
      #binding.pry
      return available_rooms
    end
  end
end
