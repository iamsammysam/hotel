require_relative 'test_helper'

describe "Room Class" do
  describe "initialize" do
    it "is an instance of Room" do 
      @room = Hotel::Room.new(18, 200)
      expect(@room).must_be_kind_of Hotel::Room
    end 
    
    it "checks data structures at initialize" do
      @room = Hotel::Room.new(18, 200)
      expect(@room.room_number).must_be_kind_of Integer
      expect(@room.room_cost).must_be_kind_of Integer
      #expect(@room.reservations).must_be_kind_of Array
    end
  end
  
  # describe "method add_reservation" do
  # end 
  
  describe "method room_status" do
    it "returns room status for a date range" do
      room = Hotel::Room.new(18, 200)
      reservation = Hotel::Reservation.new(1, room, Date.new(2018,01,01), Date.new(2018,01,06))
      
      #expect(room.room_status(Date.new(2018,01,01), Date.new(2018,01,06))).must_equal true
      
      room.add_reservation(reservation)
      expect(room.room_status(Date.new(2018,01,01), Date.new(2018,01,06))).must_equal Array
    end
  end
end
