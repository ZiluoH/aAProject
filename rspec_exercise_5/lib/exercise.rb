
def zip(*arr)
    # (0..arr.length).map do |i|
    #     arr.map do |sub_arr|
    #         sub_arr[i]
    #     end
    # end
    arr.transpose
end


def prizz_proc(arr, prc1, prc2)
    new_arr = []
    arr.each do |el|
        if prc1.call(el) ^ prc2.call(el)
            new_arr << el
        end
    end
    new_arr
end

def zany_zip(*arr)
    (0..arr.length).map do |i|
        arr.map do |sub_arr|
            sub_arr[i]
        end
    end
end


def maximum(arr, &prc)
    max = arr[0]
    arr.each do |ele|
        if prc.call(ele) >= prc.call(max) 
            max = ele
        end
    end
    max
end

def my_group_by(arr, &prc)
    hash = Hash.new { |k, v| k[v] = [] }
    arr.each do |el|
        hash[prc.call(el)] << el
    end
    hash
end


def max_tie_breaker(arr, tie_breaker, &prc)
    max = arr[0]
    arr.each do |ele|
        if prc.call(ele) > prc.call(max)
            max = ele
        elsif prc.call(ele) == prc.call(max) && tie_breaker.call(ele) > tie_breaker.call(max)
            max = ele       
            end
        end
    max
end


def remove_vowels(word)
    vowels = "aeiou"
    vowels_arr_index = []
    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            vowels_arr_index << idx
        end
    end
    return word[vowels_arr_index[0]..vowels_arr_index[-1]]
end

def vowels_count (word)
    vowels = "aeiou"
    count = 0
    word.each_char {|char| count += 1 if vowels.include?(char)}
    return count
end


def silly_syllables(sentence)
    words = sentence.split(" ")
    words.map! do |word|
        if vowels_count(word) < 2 
            word 
            
        else
            remove_vowels(word)
    end
end

words.join(" ")
    
end


      p  silly_syllables('properly precisely written code') #'ope ecise itte ode'
       p silly_syllables('trashcans collect garbage')#'ashca olle arbage'


    
      p  silly_syllables('properly and precisely written code') #'ope and ecise itte ode'
       p  silly_syllables('the trashcans collect all my garbage') #'the ashca olle all my arbage'
