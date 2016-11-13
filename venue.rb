class Venue
    attr_reader :log
    def initialize(rooms, log)
        @rooms = rooms
        @log = log
    end
    
    def find_available_rooms
        found_rooms = @rooms.select { |room| !room.is_full?}
        room_names = found_rooms.map{ |room| room.name}
        @log.add_message("The following rooms are empty: #{room_names.join(" ")}")
        return found_rooms 
    end

    def add_guest_to_room(guest, room)
        if ( guest.can_pay?(room.entry_fee) && !room.is_full? )
            room.add_guest(guest) 
            guest.pay(room.entry_fee) 
        end
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