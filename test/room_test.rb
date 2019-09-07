require_relative 'test_helper'

describe "Room Class" do
  describe "initialize" do
    
    it "is an instance of Room" do 
      room = Hotel::Room.new(18, 200)
      expect(room).must_be_kind_of Hotel::Room
    end 
  end
end 
