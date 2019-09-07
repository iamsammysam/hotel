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
  end 
  
  describe "method list_rooms" do 
    it "method returns an array" do
      rooms = @hotel_organizer.list_rooms
      expect(rooms).must_be_kind_of Array
    end
    
    it "rooms array contains 20 rooms" do
      expect(@hotel_organizer.rooms.length).must_equal 20
    end
  end
  
  describe "method make_reservation" do 
    before do
      @reservation = @hotel_organizer.make_reservation(1, 18, Date.new(2018,01,01), Date.new(2018,01,06))
    end
    
    it "returns an instance of Reservation" do
      expect(@reservation).must_be_kind_of Hotel::Reservation
    end
    
    it "will generate a new id for each reservation" do 
      expect(@reservation.reservation_id).must_equal 1
    end
    
    # it "takes to date objects and returns a reservation" do
    #   make this test
    # end
  end 
  
  describe "method add_reservation" do   
    it "will create a list of new reservations" do
      reservation1 = @hotel_organizer.make_reservation(1, 18, Date.new(2018,01,01), Date.new(2018,01,06))
      reservation2 = @hotel_organizer.make_reservation(2, 13, Date.new(2018,01,10), Date.new(2018,01,12))
      reservation3 = @hotel_organizer.make_reservation(3, 07, Date.new(2018,02,02), Date.new(2018,02,10))
      
      @hotel_organizer.add_reservation(reservation1)
      @hotel_organizer.add_reservation(reservation2)
      @hotel_organizer.add_reservation(reservation3)
      
      reservations_after = @hotel_organizer.reservations.length
      
      expect(@hotel_organizer.reservations).must_include reservation1
      expect(@hotel_organizer.reservations).must_include reservation2
      expect(@hotel_organizer.reservations).must_include reservation3
      expect(reservations_after).must_equal 3
    end      
  end
end
