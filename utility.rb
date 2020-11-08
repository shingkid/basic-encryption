def letter?(ch)
    ch =~ /[A-Za-z]/
end

def to_arr(x)
    if x.kind_of?(String)
        return x.split(" ")
    end
    return x
end

def count_english(text)
    count = 0
    arr = tokenise(text)
    arr.each do |word|
        if has_word?(word)
            count += 1
        end
    end
    return count
end

def has_word?(word)
    File.readlines('words.txt').each do |line|
        return true if line.strip == word.downcase
    end
    return false
end

def tokenise(text)
    return text.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ')
end