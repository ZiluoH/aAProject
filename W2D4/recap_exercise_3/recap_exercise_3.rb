#no_dupes?

def no_dupes?(arr)
    uniq_arr = arr.uniq
    new_arr = []
    uniq_arr.each do |el|
        if arr.count(el) == 1
            new_arr << el
        end
    end
    p new_arr
end




def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        return false if arr[i] == arr[i + 1]
    end
    true
end



def char_indices(str)
    hash = Hash.new {|h, k| h[k] = []}
    str.each_char.with_index {|char, idx| hash[char] << idx}
    p hash
end





def longest_streak(str)
    current_streak = ""
    longest_streak = ""
    return str if str.length == 1
    (0...str.length - 1).each do |i|
        if str[i] == str[i + 1]
            current_streak += str[i]
        else
            current_streak = str[i + 1]
        end
        if current_streak.length >= longest_streak.length
            longest_streak = current_streak
        end
    end
    longest_streak
end



def bi_prime?(num)
    (2...num).each do |i|
        if num % i == 0 && is_prime?(i)
            return true if is_prime?(num/i)
        end
    end
    false
end

def is_prime?(num)
    return false if num < 2
    (2...num).each {|i| return false if num % i == 0}
    return true
end



def vigenere_cipher(message, keys)
    alpha = ("a".."z").to_a
    new_str = ""
    message.each_char.with_index do |char, idx|
        old_index = alpha.index(char)
        new_index = old_index + keys[idx % keys.length]
        new_char = alpha[new_index % 26]
        new_str += new_char
    end
    return new_str
end
           


def vowel_rotate(str)
    vowels = "aeiou"
    vowels_arr = []
    str.each_char { |char| vowels_arr << char if vowels.include?(char) }

    arr = vowels_arr.rotate(-1)
    new_str = ""
    str.each_char do |char| 
        if vowels.include?(char)
            new_char = arr.shift
            new_str += new_char
        else
            new_str += char
        end
    end
    new_str
end


class String

    def select(&prc)
        new_str = ""
        if prc.nil?
            return ""
        end
        self.each_char do |char|
            if prc.call(char)
              new_str += char
            end
        end
        

        new_str
    end

    def map!(&prc)
        self.each_char.with_index do |char, i|
           self[i] = prc.call(char, i)
        end
        self
    end
 
end


def multiply(num1, num2)
    return 0 if num2 == 0
    if num2 > 0
        num1 + multiply(num1, num2 - 1)
    else
        -(num1 + multiply(num1, -num2 - 1))
    end
end


def lucas_sequence(n)
    return [] if n ==0
    return [2] if n == 1
    return [2, 1] if n == 2


    arr = lucas_sequence(n - 1)
    arr << arr[-1] + arr[-2]
    # arr = [2, 1, 3]
    # until arr.length == n
    #     arr << arr[-1] + arr[-2]
    # end
    return arr
end

