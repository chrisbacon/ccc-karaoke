class Room
    attr_reader :name, :capacity

    def initialize(name, capacity, machine)
        @name = name
        @capacity = capacity
        @guests = []
        @machine = machine
    end

    def number_of_guests
        return @guests.length
    end

    def is_full?
        return number_of_guests == @capacity
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
    
end