class Room
    attr_reader :name, :capacity, :entry_fee

    def initialize(name, entry_fee, capacity, jukebox)
        @name = name
        @entry_fee = entry_fee
        @capacity = capacity
        @guests = []
        @jukebox = jukebox
    end

    def add_guest(guest)
        return false if is_full?
        @guests.push(guest)
        return true
    end

    def remove_guest(guest)
        @guests.delete(guest)
    end

    def has_guest?(guest)
        return @guests.include?(guest)
    end

    def number_of_guests
        return @guests.length
    end

    def is_full?
        return number_of_guests == @capacity
    end
    
end