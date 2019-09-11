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
    
    def make_reservation(room_number, start_date, end_date, range)  
      room = list_available_rooms(start_date, end_date).first
      reservation = Hotel::Reservation.new(room, start_date, end_date, range)
      return reservation
    end
    
    def add_reservation(reservation)
      @reservations << reservation
    end 
    
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
      #binding.pry - ok
      return reservations_by_date
    end
    
    def rooms_available?(room, start_date, end_date)            
      reservations.each do |reservation|
        
        while start_date != end_date
          if reservation.date_range.include?(start_date)
            result = false
          else
            result = true
          end
          start_date += 1
        end  
        return result
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
