require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../person')

class TestRoom < Minitest::Test

    def setup
        machine = {}
        @guest1 = Person.new("Chris", 30, 100)
        @guest2 = Person.new("Todd", 29, 80)

        @room = Room.new('Classic', 30, 1, {})
    end

    def test_room_has_name
        assert_equal("Classic", @room.name)
    end

    def test_room_has_entry_fee
        assert_equal(30, @room.entry_fee)
    end

    def test_room_has_size
        assert_equal(1, @room.capacity)
    end

    def test_number_of_guests
        assert_equal(0, @room.number_of_guests)
    end

    def test_add_guest
        @room.add_guest(@guest1)
        assert_equal(1, @room.number_of_guests)
    end

    def test_is_full?
        @room.add_guest(@guest1)
        assert_equal(true, @room.is_full?)
    end

    def test_cannot_add_guests_above_capacity
        @room.add_guest(@guest1)
        was_guest_added = @room.add_guest(@guest2)
        assert_equal(false, was_guest_added)
    end

    def test_remove_guest
        @room.add_guest(@guest1)
        @room.remove_guest(@guest1)
        assert_equal(0, @room.number_of_guests)
    end

    def test_has_guest
        @room.add_guest(@guest1)
        assert_equal(true, @room.has_guest?(@guest1))
    end   

end
