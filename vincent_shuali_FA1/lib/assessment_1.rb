# Define your methods here.

def my_map!(arr, &prc)
    arr.each.with_index do |ele, i|
        arr[i] = prc.call(ele)
    end
end

def two?(arr, &prc)
    arr.count {|ele| prc.call(ele)} == 2
end

def nor_select(arr, prc1, prc2)
    arr.select {|ele| (!prc1.call(ele) && !prc2.call(ele))}
end

def array_of_hash_sum(arrhash)
    arrhash.inject(0) {|acc, curr| curr.values.sum + acc}
end

def slangify(sentence)
    words = sentence.split
    vowels = "aeiou"

    words.map do |word|
        # word.gsub(/^([^aeiou]*)[aeiou]/, '\1')
        
        letters = word.split('')

        firstvowel = letters.index {|char| vowels.include?(char)}

        if(firstvowel)
            word[firstvowel] = ""
        end

        word

        
    end.join(' ')

end

def char_counter(str, *chars)
    charcounthash = str.split('').tally

    if(chars.length > 0)
        outputhash = {}
        chars.each do |char|
            outputhash[char] = charcounthash[char] || 0
        end
        outputhash
    else
        charcounthash
    end
end
