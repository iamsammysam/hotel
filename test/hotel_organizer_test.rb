require_relative 'test_helper'

describe "HotelOrganizer Class" do  
  before do
    @hotel_organizer = Hotel::HotelOrganizer.new
    
    @reservation1 = @hotel_organizer.make_reservation(Date.new(2018,01,01), Date.new(2018,01,06), nil)
    @reservation2 = @hotel_organizer.make_reservation(Date.new(2018,01,03), Date.new(2018,01,12), nil)
    @reservation3 = @hotel_organizer.make_reservation(Date.new(2018,02,02), Date.new(2018,02,10), nil)
  end 
  
  describe "initialize" do
    it "is an instance of HotelOrganizer" do
      expect(@hotel_organizer).must_be_kind_of Hotel::HotelOrganizer    
    end 
    
    it "checks data structures at initialize" do
      expect(@hotel_organizer.rooms).must_be_kind_of Array
      expect(@hotel_organizer.reservations).must_be_kind_of Array
    end
  end 
  
  describe "method total_rooms" do 
    it "method returns an array" do
      rooms = @hotel_organizer.total_rooms
      expect(rooms).must_be_kind_of Array
    end
    
    it "rooms array contains 20 rooms" do
      expect(@hotel_organizer.rooms.length).must_equal 20
    end
  end
  
  describe "method make_reservation" do
    it "returns an instance of Reservation" do
      expect(@reservation1).must_be_kind_of Hotel::Reservation
      expect(@reservation2).must_be_kind_of Hotel::Reservation
      expect(@reservation3).must_be_kind_of Hotel::Reservation
    end
  end 
  
  describe "method list_reservations by date" do
    it "returns an array" do       
      reservations_by_date = @hotel_organizer.list_reservations(Date.new(2018,01,05))
      expect(reservations_by_date).must_be_kind_of Array
    end 
    
    it "takes a date and returns a list of reservations" do       
      reservations_by_date = @hotel_organizer.list_reservations(Date.new(2018,01,05))
      reservations_after = reservations_by_date.length
      expect(reservations_after).must_equal 2
    end 
    
    it "raises error when no no reservations for that date" do   
      expect do 
        @hotel_organizer.list_reservations(Date.new(2018,10,10))
      end.must_raise ArgumentError
    end
  end 
  
  describe "method room_available?" do
    before do
      @room1 = @hotel_organizer.rooms[0]    
      @hotel_organizer.reservations << Hotel::Reservation.new(@room1, Date.new(2018,01,01),Date.new(2018,01,06), nil)
    end
    
    it "returns false if not available" do  
      reservations_rooms_by_date = @hotel_organizer.room_available?(@room1, Date.new(2018,01,01),Date.new(2018,01,06))
      expect(reservations_rooms_by_date).must_equal false
    end 
    
    it "returns an true if available" do 
      reservations_rooms_by_date = @hotel_organizer.room_available?(@room1, Date.new(2018,01,12),Date.new(2018,01,16))      
      expect(reservations_rooms_by_date).must_equal true
    end
    
    it "returns true if available for the end_date" do
      reservations_rooms_by_date = @hotel_organizer.room_available?(@room1, Date.new(2018,01,06),Date.new(2018,01,07))
      expect(reservations_rooms_by_date).must_equal true 
    end
  end
  
  describe "method list_available_rooms" do
    it "returns an array" do 
      list_rooms = @hotel_organizer.list_available_rooms(Date.new(2018,12,10),Date.new(2018,12,15))
      expect(list_rooms).must_be_kind_of Array
    end 
    
    it "returns all rooms if dates are available" do 
      list_rooms = @hotel_organizer.list_available_rooms(Date.new(2018,12,10),Date.new(2018,12,15))
      
      rooms_after = list_rooms.length
      expect(rooms_after).must_equal 20
    end 
    
    it "returns only the rooms that have dates available" do     
      list_rooms = @hotel_organizer.list_available_rooms(Date.new(2018,01,01),Date.new(2018,01,06))
      
      rooms_after = list_rooms.length
      expect(rooms_after).must_equal 18
    end 
  end
end
