# Define your methods here.

def string_map!(str, &prc)
    (0...str.length).each {|i| str[i] = prc.call(str[i])}
    str
end

def three?(arr, &prc)
    count = 0
    arr.each {|ele| count+=1 if prc.call(ele)}
    count == 3
end

def nand_select(arr, prc1, prc2)
    arr.select {|ele| !(prc1.call(ele) && prc2.call(ele))}
end

def hash_of_array_sum(hash)
    sum = 0
    hash.each {|k, arr| arr.each {|ele| sum += ele}}
    sum
end

def abbreviate(sentence)
    words = sentence.split(" ")
    new_words = []
    words.each do |word|
        if word.length > 4
            new_words << remove_vowels(word)
        else
            new_words << word 
        end
    end
    new_words.join(" ")
end

def remove_vowels(word)
    vowels = "aeiou"
    new_word = ""
    word.each_char {|char| new_word += char if !vowels.include?(char.downcase)}
    new_word 
end

def hash_selector(hash, *args)
    return hash if args.length == 0

    new_hash = {}
    hash.each {|k, v| new_hash[k] = v if args.include?(k)}
    new_hash
end