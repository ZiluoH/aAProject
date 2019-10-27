require './item.rb'
require './list.rb'

class TodoBoard
    def initialize
        @lists = {}

        # {Grocery => <List#00234@label="Grocery">, tech => list }
    end


    #mktodo groceries butter 2019-10-24
    #mktodo label title #deadline #optional_description
    # label = args[0]
    # title #deadline #optional_description = args[1..-1]

    # add_item(title, deadline, description = "")
    
    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')
        label = args[0]
        case cmd
        when 'mklist'
            # mklist Grocery
            # key = label
            # value = items which is an array
            @lists[label] = List.new(label)
        when 'ls'
            @lists.each {|k, v| puts k}
        when 'showall'
            @lists.each {|k, v| v.print}
        when 'mktodo'
            @lists[label].add_item(*args[1..-1])
        when 'up'
            @lists[label].up(*args[1..-1].map(&:to_i))
        when 'down'
            @lists[label].down(*args[1..-1].map(&:to_i))
        when 'swap'
            @lists[label].swap(*args[1..-1].map(&:to_i))
        when 'sort'
            @lists[label].sort_by_date!
        when 'priority'
            @lists[label].priority
        when 'print'
            if args[1..-1].empty?
                @lists[label].print
            else
                @lists[label].print_full_item(*args[1..-1].join("").to_i)
            end
        when 'toggle'
            @lists[label].toggle_item(args[1].to_i) # maybe change label to args[1]?
        when 'rm'
            @lists[label].remove_item(args[1].to_i)
        when 'purge'
            @lists[label].purge
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        while true
            if get_command == false
                return false
            end 
        end
    end
end