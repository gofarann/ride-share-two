require_relative "spec_helper"
require 'pry'

describe "Rideshare::Rider" do
  before do
    Rideshare::Driver.all
    Rideshare::Trips.all
    Rideshare::Rider.all
  end


  describe "Rider#all" do
    it "returns an array of all riders" do
      Rideshare::Rider.all_riders.must_be_instance_of Array
    end

    it "returns the right number of riders" do
      Rideshare::Rider.all_riders.length.must_equal 300
    end


  end

  describe "Rider#find" do

    it "returns the rider given an id" do
      Rideshare::Rider.find(1).must_be_instance_of Rideshare::Rider
    end

    it "raises an error if the rider id is not valid" do
      proc { Rideshare::Rider.find(1000)
      }.must_raise ArgumentError
    end

  end

  describe "Rider#trips" do

    it "returns an argument error for riders with no trips" do
      proc {
        Rideshare::Rider.find(300).trips
      }.must_raise ArgumentError
    end

  end

  describe "Rider#drivers" do

    it "returns an array of drivers for the rider instance" do
      Rideshare::Rider.find(200).drivers.must_be_instance_of Array
      Rideshare::Rider.find(200).drivers.first.must_be_instance_of Rideshare::Driver
    end

    it "raises an error when the rider has no drivers" do
      proc { Rideshare::Rider.find(300).drivers }.must_raise ArgumentError
    end

    it "returns unique trip instances for driver/riders with more than 1 trip" do
      Rideshare::Rider.find(164).drivers.length.must_equal 5
    end

  end

  describe "Rider#all_spend" do
    it "returns total spending of rider instance" do
      Rideshare::Rider.all_riders.first.all_spend.must_be_instance_of Integer
    end
  end
end
