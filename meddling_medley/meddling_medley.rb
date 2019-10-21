def conjunct_select(arr, *prcs)
    new_arr = []
    arr.each do |el|
        if  prcs.all? {|prc| prc.call(el)}
            new_arr << el
        end
    end
    new_arr
end

def convert_pig_latin(sent)
    vowels = "aeiou"
    words = sent.split(' ')
    new_words = []
    words.each do |word|
        if word.length < 3
            new_words << word
        elsif vowels.include?(word[0])
            new_words << word + "yay"
        else new_words << non_vowel(word)
        end
    end

    words.each_with_index do |word, idx|
        if word == word.capitalize
            new_words[idx] = new_words[idx].capitalize
        end
    end
    return new_words.join(" ")
end

def non_vowel(word)
    vowels = "aeiou"
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            return word[i..-1] + word[0...i] + "ay"
        end
    end
end





def disjunct_select(arr, *prcs)
    new_arr = []
    arr.each do |el|
        if prcs.any? {|prc| prc.call(el)}
            new_arr << el
        end
    end
    new_arr
end

def alternating_vowel(sent)
    words = sent.split(" ")
    new_arr = []
    words.each_with_index do |word, i|
        if i.even?
            new_arr << remove_first(word)
        else
            new_arr << remove_first(word.reverse).reverse
        end
    end
    new_arr.join(' ')
end


def remove_first(word)
    vowels = "aeiou"
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            return word[0...i] + word[(i+1)..-1]
        end
    end
end




