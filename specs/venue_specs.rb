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

    def test_add_guest_to_room__can_afford_entry
        result = @venue.add_guest_to_room(@guest2, @room2)
        assert(result)
    end

    def test_add_guest_to_room__cant_afford_entry
        @guest2.money = 20
        result = @venue.add_guest_to_room(@guest2, @room2)
        assert(!result)
    end



end
