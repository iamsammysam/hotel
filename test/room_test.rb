require_relative 'test_helper'

describe "Room Class" do
  before do
    @hotel_organizer = Hotel::HotelOrganizer.new
    @reservation1 = @hotel_organizer.make_reservation(Date.new(2018,01,01), Date.new(2018,01,06), nil)
    @reservation2 = @hotel_organizer.make_reservation(Date.new(2018,01,03), Date.new(2018,01,12), nil)
    @reservation3 = @hotel_organizer.make_reservation(Date.new(2018,02,02), Date.new(2018,02,10), nil)
  end
  
  describe "initialize" do
    it "is an instance of Room" do 
      @room = Hotel::Room.new(18, 200)
      expect(@room).must_be_kind_of Hotel::Room
    end 
    
    it "checks data structures at initialize" do
      @room = Hotel::Room.new(18, 200)
      expect(@room.room_number).must_be_kind_of Integer
      expect(@room.room_cost).must_be_kind_of Integer
    end
  end 
  
  describe "method add_reservation" do   
    it "will create a list of new reservations" do
      @room = Hotel::Room.new(18, 200)
      
      @room.add_reservation(@reservation1)
      @room.add_reservation(@reservation2)
      @room.add_reservation(@reservation3)
      reservations_after = @room.reservations.length   
      expect(reservations_after).must_equal 3
    end      
  end
end
