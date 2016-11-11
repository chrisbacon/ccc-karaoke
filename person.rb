class Person

    attr_reader :name, :age
    attr_accessor :money

    def initialize(name, age, money)
        @name = name
        @age = age
        @money = money
    end

    def sing(song)
        return "It's true that all the men you knew were dealers"
    end
    
    
end