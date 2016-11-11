class Venue
    def initialize(rooms, log)
        @rooms = rooms
        @log = log
    end
    
    def find_available_rooms
        return @rooms.select { |room| !room.is_full?}
    end

    def add_guest_to_room(guest, room)
        return room.add_guest(guest) if guest.money > room.entry_fee
        return false
    end
    
    def find_room_guest_is_in(guest)
        for room in @rooms
            return room if room.has_guest?(guest)
        end
        return nil
    end

    def remove_guest(guest)
        room = find_room_guest_is_in(guest)
        room.remove_guest(guest)
    end

    
end