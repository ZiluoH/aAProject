
#Phase 1
def strange_sums(arr)
    count = 0
    arr.each_with_index do |num_1,idx_1|
        arr.each_with_index do |num_2,idx_2|
            if idx_2 > idx_1
                count += 1 if num_1 + num_2 == 0
            end
        end    
    end

    count
end

def pair_product(arr,product)
    arr.each_with_index do |num_1,idx_1|
        arr.each_with_index do |num_2,idx_2|
            if idx_2 > idx_1 && num_1 * num_2 == product
                return true 
            end
        end    
    end

    false
end


def rampant_repeats(str, hash)
    str_2 = ""
    str.each_char do |char|
        if hash.key?(char)
            str_2 += char * hash[char] 
        else
            str_2 += char
        end
    end

    str_2
end


def perfect_square(num)
    (0..num).any? { |n| n * n == num}
end



#Phase 2
def anti_prime?(num)
    divisor_count = Hash.new(0)
    
    (0..num).each { |n| divisor_count[n] += 0}
    p divisor_count
end


def mutual_factors(*num) 
    divisors = []
    common_divisors = Hash.new(0)

    num.each { |n| divisors << divisor_count(n)  }

    divisors.flatten.each { |divisor| common_divisors[divisor] += 1}
    common_divisors
    common_divisors_2 = common_divisors.select{ |k,v| v == num.length}.keys
end

def divisor_count(num)
    (1..num).select { |n| num % n == 0} 
end

 


def tribonacci_number(num)
    seq = [1,1,2]

    while seq.length < num
        seq << seq[-1] + seq[-2] + seq[-3]
    end

    seq[num - 1]
end


# -------------------------------------




def matrix_addition_reloaded(*matrix)


    matrix.each do |sub|
        return nil if matrix[0].length != sub.length
    end

    new_arr = []
    transposed_1 = matrix.transpose
    transposed_1.each do |sub|
        sub.transpose.each { |sub| new_arr << sub.sum}
    end

    new_arr.each_slice(2).to_a
end







def squarocol?(arr)
    arr.each do |sub|
        sub.each do |char| 
            if sub.count(char) == sub.length 
                return true
            end
        end
    end
    trans_arr = arr.transpose
    trans_arr.each do |sub|
        sub.each do |char| 
            if sub.count(char) == sub.length 
                return true
            end
        end
    end
    return false
end




def pascals_triangle(num)
    tri = [[1]]
    while tri.length < num
        tri << help_sum(tri[-1])
    end
    return tri
end

def help_sum(arr)
    new_arr = [1]
    (0...arr.length-1).each do |i|
     new_arr << (arr[i] + arr[i+1])
    end
    new_arr << 1
    return new_arr
end


def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        return false if num % i == 0
    end
    true
end


def mersenne_prime(nth)
    count = 0
    x = -1
    while count < nth
        x += 1
        if is_prime?(2**x - 1)
            count += 1
        end
    end
    return 2**x - 1
end


def tri_seq (n)
    seq = []
    i = 1
    while i <= n
        seq << (i*(i+1))/2
        i += 1
    end
    return seq
end

def triangular_word?(word)
    alpha = ("a".."z").to_a
    total_value = word.split("").map {|char| alpha.index(char) + 1}.sum
    tri_seq(total_value).include?(total_value)
end






def collapse(arr)
    (0...arr.length - 1).each do |i|
        if arr[i] + 1 == arr[i + 1] || arr[i] == arr[i + 1] + 1
            return arr[0...i] + arr[i + 2..-1]
        end
    end
    return arr
end


def consecutive_collapse(arr)
    arr.each {arr = collapse(arr)}
    return arr
end



