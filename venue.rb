class Venue
    def initialize(rooms, log)
        @rooms = rooms
        @log = log
    end
    
    def find_available_rooms
        return @rooms.select { |room| !room.is_full?}
    end
    
end