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
        @guests.push(guest) if !is_full?
    end

    def remove_guest(name)
        guest = @guests.select{ |g| g.name == name }
        @guests.delete(guest[0])
    end

    def has_guest?(name)
        guest_names = @guests.map { |g| g.name }
        return guest_names.include?(name)
    end

    def number_of_guests
        return @guests.length
    end

    def is_full?
        return number_of_guests == @capacity
    end
    
end