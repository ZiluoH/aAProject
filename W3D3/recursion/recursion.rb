def range(start_range, end_range)  #1,5 -> 2,5 -> 3,5 -> 4,5 dont run if start_range == end_range
    return [] if end_range - 1 < start_range

    # return [start_range] if end_range == start_range
    range(start_range , end_range - 1) << end_range - 1
 

end

#p range(1, 5)

def recursive_sum(array)
    new_array = array.dup
    return new_array[0] if new_array.length <= 1
    new_array.pop + recursive_sum(new_array)
end

#p recursive_sum([4, 5, 10])

def iterative_sum(array)
    sum = 0
    array.each { |ele| sum += ele}
    sum
end

#p iterative_sum([4, 5, 10])

def exp_1(num, pow)     #  b * exp(b, n - 1)
    return 1 if pow == 0
    return num if pow == 1
    num * exp_1(num, pow - 1)
end

#p exp_1(2, 5)

def exp_2(num, pow)
    return 1 if pow == 0
    return num if pow == 1
    if pow % 2 == 0
        val = exp_2(num, pow / 2)
        val * val
    else
        val =  (exp_2(num, (pow - 1) / 2))
        num * val * val
    end
end

#p exp_2(3, 3)
class Array
    def deep_dup #(array)     #[1, [2], [3, [4]]]
        arr = []
        self.each do |el|
            if el.is_a?(Array)
                arr << el.deep_dup
            else
                arr << el
            end
        end
        #p arr
    end

    #[1, [2], [3, [4]]].deep_dup
end

def fib_r(n)
    return [0,1].take(n) if n <= 2
    prev_fib = fib_r(n - 1)
    next_fib = prev_fib[-1] + prev_fib[-2]
    prev_fib << next_fib
end

def fib_i(n)
    return [0,1].take(n) if n <= 2
    count = 2
    fibs = [0, 1]
    while count < n
        fibs << fibs[-1] + fibs[-2]
        count += 1
    end
    fibs
end

# p fib_r(1)
# p fib_r(4)
# p fib_r(6)
# p fib_i(1)
# p fib_i(4)
# p fib_i(6)

require'byebug'

def bsearch(array, target)
    return nil if array.empty?
# debugger
    mid = array.length/2
    #mid_right = array.length/2
    left_half = array[0...mid]
    right_half = array[mid + 1..-1]
    #target <=> array[mid] 1(>), 0, -1(<)
    case target <=> array[mid]
    when 1 #bsearch right
        result = bsearch(right_half, target)
        if !result.nil?
            result + mid + 1
        else
            nil
        end

        #mid_right 
    when 0
        mid
    when -1
        bsearch(left_half, target)
    end

    
end

# target = 3
# [2,3,4,5]
# mid = 2
# left_half = [2,3]
# right_half = [5]



# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(array)
    return array if array.length < 2
    mid = array.length/2
    left = array.take(mid)
    right = array.drop(mid)
    # debugger
    left_sorted = merge_sort(left)
    right_sorted = merge_sort(right)

    merge(left_sorted, right_sorted)
end


def merge(left, right)
    merged = []
    until left.empty? || right.empty?
        (left.first < right.first) ? merged << left.shift : merged << right.shift
        # if left.first < right.first
        #     merged << left.shift
        # else
        #     merged << right.shift
        # end
        
    end
    merged + left + right
end

# p merge_sort([38, 27, 43, 3, 9, 82, 10])


def subsets(array)
    return [[]] if array.empty?
    sub_array = subsets(array.take(array.length - 1))
    sub_array + sub_array.map { |ele| ele + [array.last]}#[[], [1], [2]]

end

# p subsets([1, 2, 3]) 
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


def permutations(array)
    return if #answer.length == array.length!

    [1, 2].push(3)
    [1, 2].shift[3]
    [1, 2].take(1) + [3] + [1, 2].drop(1)
end

































