require './item.rb'
require './list.rb'

class TodoBoard
    def initialize(label)
        @list = List.new(label)
    end
    
    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo'
            @list.add_item(*args)
        when 'up'
            @list.up(*args.map(&:to_i))
        when 'down'
            @list.down(*args.map(&:to_i))
        when 'swap'
            @list.swap(*args.map(&:to_i))
        when 'sort'
            @list.sort_by_date!
        when 'priority'
            @list.priority
        when 'print'
            # print <arg>
            if args.empty?
                @list.print
            else
                @list.print_full_item(args.join("").to_i)
            end
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