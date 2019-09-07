require_relative 'test_helper'

describe "HotelOrganizer Class" do  
  before do
    @hotel_organizer = Hotel::HotelOrganizer.new
  end 
  
  describe "initialize" do
    it "is an instance of HotelOrganizer" do
      expect(@hotel_organizer).must_be_kind_of Hotel::HotelOrganizer    
    end 
    
    it "checks data structures at initialize" do
      expect(@hotel_organizer.rooms).must_be_kind_of Array
      expect(@hotel_organizer.reservations).must_be_kind_of Array
    end
    
    it "checks that rooms contains 20 rooms" do
      expect(@hotel_organizer.rooms.length).must_equal 20
    end
  end 
end
