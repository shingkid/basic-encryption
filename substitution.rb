load 'utility.rb'

def enSubstitute(plain, keyword)
    shift = keyword
    ('a'...'z').each do |ch|
        if !keyword.include?(ch)
            shift += ch
        end
    end
    shift = alphabet[k...26] + alphabet[0...k]

    cipher = ""

    # For each letter, search for index and add 97.
    for i in 0...plain.length
        p = plain[i].downcase
        if letter?(p)
            cipher += (shift.index(p) + 'a'.ord).chr
            if p != plain[i]
                cipher[-1] = cipher[-1].upcase
            end
        else
            cipher += p
        end
    end

    return cipher
end

def deSubstitute(cipher)
    for i in cipher.length.downto(0)
        substr = cipher[0...i]
        if has_word?(substr)
            return substr
        end
    end
end

puts enSubstitute('Hello world', 'zebra')
puts deSubstitute('Jbnnq xqdng')