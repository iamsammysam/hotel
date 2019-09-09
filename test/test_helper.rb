# require "simplecov"
# SimpleCov.start

require "minitest"
require "minitest/autorun"
require "minitest/reporters"

require "date"
require "pry"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# require_relative your lib files here
require_relative "../lib/hotel_organizer"
require_relative "../lib/reservation"
require_relative "../lib/room"

