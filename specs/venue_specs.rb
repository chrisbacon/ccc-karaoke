require('minitest/autorun')
require('minitest/rg')
require_relative("../venue")
require_relative("../room")
require_relative("../person")
require_relative("../log")

class TestVenue < Minitest::Test

    def setup
        log = Log.new("Start of log")
        machine = {}
        @guest1 = Person.new("Chris", 30, 100)
        @guest2 = Person.new("Todd", 29, 80)
        @guest3 = Person.new("Rob", 31, 100)

        @room1 = Room.new('Classic', 30, 1, {})
        @room1.add_guest(@guest1)

        @room2 = Room.new('Modern', 100, 2, {})
        rooms = [@room1, @room2]

        @venue = Venue.new(rooms, log)
    end

    def test_find_available_rooms
        assert_equal([@room2], @venue.find_available_rooms())
    end

    def test_add_guest_to_room__can_afford_entry
        result = @venue.add_guest_to_room(@guest3, @room2)
        assert_equal(1, @room1.number_of_guests)
        assert_equal(0, @guest3.money)
    end

    def test_add_guest_to_room__cant_afford_entry
        result = @venue.add_guest_to_room(@guest2, @room2)
        assert_equal(0, @room2.number_of_guests)
        assert_equal(80, @guest2.money)
    end

    def test_find_room_guest_is_in
        room = @venue.find_room_guest_is_in(@guest1)
        assert_equal(@room1, room)
    end

    def test_remove_guest
        @venue.remove_guest(@guest1)
        room = @venue.find_room_guest_is_in(@guest1)
        assert_equal(nil, room)
    end

end
