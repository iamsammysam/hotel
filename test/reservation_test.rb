require_relative 'test_helper'

describe "Reservation Class" do
  describe "initialize" do
    it "is an instance of Reservation" do 
      reservation = Hotel::Reservation.new(1, 18, Date.new(2018,01,01), Date.new(2018,01,06))
      expect(reservation).must_be_kind_of Hotel::Reservation
    end
    
    it "is initialized with two dates" do
      start_date = Date.new(2018, 01, 01)
      end_date = Date.new(2018, 01, 06)
      
      expect(start_date).must_equal start_date
      expect(end_date).must_equal end_date
    end 
    
    it "raises an error when end_date is before start_date" do
      expect do 
        Hotel::Reservation.new(1, 18, Date.new(2018,01,06), Date.new(2018,01,01))
      end.must_raise ArgumentError
    end
    
    it "raises an error when start_date is nil" do
      expect do 
        Hotel::Reservation.new(1, 18, nil, Date.new(2018,01,01))
      end.must_raise ArgumentError
    end
    
    it "raises an error when end_date is nil" do
      expect do 
        Hotel::Reservation.new(1, 18, Date.new(2018,01,06), nil)
      end.must_raise ArgumentError
    end  
  end 
  
  describe "method duration" do
    it "calculates the duration of a reservation" do
      reservation = Hotel::Reservation.new(1, 18, Date.new(2018,01,01), Date.new(2018,01,06))
      expect(reservation.duration).must_equal 5
    end     
  end 
  
  describe "method total_cost" do
    it "calculates the total cost of a reservation" do
      reservation = Hotel::Reservation.new(1, 18, Date.new(2018,01,01), Date.new(2018,01,06))
      expect(reservation.total_cost).must_equal 1000
    end     
  end 
end
