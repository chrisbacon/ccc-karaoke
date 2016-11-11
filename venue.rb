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
    
    

end