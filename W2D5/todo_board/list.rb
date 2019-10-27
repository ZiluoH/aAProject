require './item.rb'

class List

    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        if !Item.valid_date?(deadline)
            return false
        else
            @items << Item.new(title, deadline, description)
            return true
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if self.size <= index || index < 0
        return true
    end

    def swap(index_1, index_2)
        if !valid_index?(index_1) || !valid_index?(index_2)
            return false
        else
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        end
    end

    def [](index)
        if !valid_index?(index)
            return nil
        else
            return @items[index]
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "------------------------"
        puts "       GROCERIES        "
        puts "------------------------"
        puts "Index | Item     | Deadline"
        puts "------------------------"
        @items.each_with_index do |item, idx|
            puts "#{idx}  | #{item.title}    | #{item.deadline}"
            puts "#{@items[index].description}"
        end
        puts "------------------------"
    end
    
    def print_full_item(index)
        if valid_index?(index)
            puts "-------------------------"
            puts "#{@items[index].title}              #{@items[index].deadline}"
            puts "#{@items[index].description}"
            puts "-------------------------"
        end
    end

    def up(index, amount = 1)
        if valid_index?(index) && index != 0
            amount.times do 
                swap(index, index-1)
                index -= 1
            end
           return true
        end
        raise "invalid index #{index}"
    end

    def down(index, amount = 1)
        if valid_index?(index) && index != @items.length - 1
            amount.times do 
                swap(index, index + 1)
                index += 1
            end
            return true
        end
        raise "invalid index #{index}"
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline }
    end
end


