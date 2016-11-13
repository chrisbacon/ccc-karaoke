class Viewer
    def initialize(log)
        @log = log        
    end

    def welcome
        puts "Welcome to Code Clan Karaoke!"
    end

    def ask_for_instruction
        puts "Do you wish to check in or check out a guest?"
        return instruction = gets.chomp
    end

    def ask_for_room
        puts "Which room should the guest check in to?"
        return input = gets.chomp
    end

    def get_guest_name
        puts "Enter guest name:"
        name = gets.chomp
        return name
    end

    def get_guest_age
        puts "Enter guest age: "
        age = gets.chomp.to_i
        return age
    end

    def get_guest_money
        puts "Enter money: "
        money = gets.chomp.to_i
        return money
    end

    def bad_input
        puts "Input not recognised, try again"
    end

    def goodbye
        puts "Goodbye! Thank you for using CCC!"
    end

    def display_rooms(rooms)
        room_names = rooms.map{ |r| r.name }
        puts "The following rooms are available: #{room_names.join(" | ")}"
    end

    def good_checkin(guest, room)
        puts "#{guest.name} was succesfully checked into the #{room.name} room!"
    end

    def ask_for_guest()
        puts "Enter the name of the guest to checkout:"
        return name = gets.chomp
    end

    def guest_not_found()
        puts "Guest not found"
    end

    def good_checkout(guest_name, room_name)
        puts "#{guest_name} was checked out of #{room_name}"
    end
end