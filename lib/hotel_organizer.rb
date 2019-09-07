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
  end
end 
