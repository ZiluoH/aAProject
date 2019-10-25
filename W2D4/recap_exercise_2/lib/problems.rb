# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    i = 1
    while true
        if i % num_1 == 0 && i % num_2 == 0
            return i
        end
        i += 1
    end 
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    arr = []
    hash = Hash.new(0)
    (0...str.length - 1).each do |i|
        arr << str[i] + str[i + 1]
    end

    arr.each do |el|
        hash[el] += 1
    end

    sorted = hash.sort_by {|k, v| v}
    return sorted[-1][0]

end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each do |k, v|
            new_hash[v] = k
        end
        return new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    #[1, 2, 1, 3, 8].pair_sum_count(5) => 1
    def pair_sum_count(num)
        count = 0
        self.each_with_index do |num_1, i|
            self.each_with_index do |num_2 , j|
                if j > i && num_1 + num_2 == num
                    count += 1
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        sorted = false
        prc ||= Proc.new {|a, b| a <=> b}

        while !sorted
            sorted = true

            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end
        return self
    end
end
