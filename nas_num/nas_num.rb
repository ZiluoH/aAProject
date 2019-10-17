
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







