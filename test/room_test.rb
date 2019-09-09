require_relative 'test_helper'

describe "Room Class" do
  before do
    @room = Hotel::Room.new(18, 200)
  end
  
  describe "initialize" do
    it "is an instance of Room" do 
      expect(@room).must_be_kind_of Hotel::Room
    end 
    
    it "checks data structures at initialize" do
      expect(@room.room_number).must_be_kind_of Integer
      expect(@room.room_cost).must_be_kind_of Integer
    end
  end 
end
