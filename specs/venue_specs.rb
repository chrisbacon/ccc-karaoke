require('minitest/autorun')
require('minitest/rg')
require_relative("../venue")
require_relative("../room")
require_relative("../person")

class TestVenue < Minitest::Test

    def setup
        log = []
        machine = {}
        @guest1 = Person.new("Chris", 30, 100)
        @guest2 = Person.new("Todd", 29, 80)

        @room1 = Room.new('Classic', 30, 1, {})
        @room1.add_guest(@guest1)

        @room2 = Room.new('Modern', 30, 1, {})
        rooms = [@room1, @room2]

        @venue = Venue.new(rooms, log)
    end

    def test_find_available_rooms
        assert_equal([@room2], @venue.find_available_rooms())
    end

end
