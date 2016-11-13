class Log
    def initialize(message)
        @time_of_last_message = 0
        @record = {@time_of_last_message => message}
    end

    def current_message
        return @record[@time_of_last_message]
    end

    def message_at_time(time)
        return @record[time]
    end

    def add_message(message)
        @time_of_last_message += 1
        @record[@time_of_last_message] = message
    end
    
end