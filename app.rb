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
        rooms = find_available_rooms()
    end

    def create_guest()
        name = @viewer.get_guest_name
        age = @viewer.get_guest_age
        money = @viewer.get_guest_money
        return Person.new(name, age, money)
    end



    def checkout()
        puts "Checking out"
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


