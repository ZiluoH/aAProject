class Item
    attr_reader :deadline, :done
    attr_accessor :title, :description

    def self.valid_date?(date_string)
        date_array = date_string.split("-")
        return false if date_array[0].length != 4
        return false if date_array[1].to_i > 12
        return false if date_array[2].to_i > 31
        return true
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        @done = false
        raise "wrong date" if !Item.valid_date?(deadline)
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline 
        else
            raise "Invalid Date"
        end
    end

    def toggle
        @done = !@done
    end


end






