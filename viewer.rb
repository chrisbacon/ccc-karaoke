class Viewer
    def initialize(log)
        @log = log        
    end

    def welcome
        puts "Welcome to Code Clan Karaoke!"
    end

    def ask_for_instruction
        puts "Do you wish to check in or check out a guest?"
        instruction = gets.chomp
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
        puts "The following rooms are available: #{rooms.join(" ")}"
    end
end