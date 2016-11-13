require_relative("venue")
require_relative("room")
require_relative("person")
require_relative("log")
require_relative("viewer")

class CCC

    def initialize(venue, viewer)
        @venue = venue
        @viewer = viewer
        @running = true
    end

    def run()
        @viewer.welcome
        while @running
            instruction = @viewer.ask_for_instruction
            handle_instruction(instruction)
        end
        @viewer.goodbye
    end

    def handle_instruction(instruction)
        case instruction
        when "check in", "in"
            checkin()
        when "check out", "out"
            checkout()
        when "exit", "quit"
            @running = false
        else
            @viewer.bad_input
        end
    end

    def checkin()
        guest = create_guest()

        rooms = @venue.find_available_rooms()
        @viewer.display_rooms(rooms)

        room = nil
        while !room
            room = choose_room_from(rooms)
            @viewer.bad_input if !room
        end

        success = @venue.add_guest_to_room(guest, room)

        if success
            @viewer.good_checkin(guest, room) 
            return
        end

        @viewer.bad_checkin(guest, room) 

    end 

    def create_guest()
        name = @viewer.get_guest_name
        age = @viewer.get_guest_age
        money = @viewer.get_guest_money
        return Person.new(name, age, money)
    end

    def choose_room_from(rooms)
        input = @viewer.ask_for_room
        for room in rooms
            return room if room.name == input
        end
        return nil
    end

    def checkout()
        guest_name = @viewer.ask_for_guest()
        room = @venue.find_room_guest_is_in(guest_name)

        if !room
            @viewer.bad_input
            return
        end

        @venue.remove_guest(guest_name)
        @viewer.good_checkout(guest_name, room.name)
    end

end

log = Log.new("")

room1 = Room.new('Classic', 30, 1, {})
room2 = Room.new('Modern', 100, 2, {})

rooms = [room1, room2]

venue = Venue.new(rooms, log)
viewer = Viewer.new(log)

karaoke = CCC.new(venue, viewer)
karaoke.run()


