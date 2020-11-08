def enCaesar(plain, k)
    alphabet = ("a".."z").to_a

    # String of letters shifted by k
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

def deCaesar(cipher)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    n = alphabet.length

    # Hash to store possible plaintexts and their number of English words
    possible = Hash.new

    # For all possible shifts in alphabet
    for i in 1...n
        shift = alphabet[i..n] + alphabet[0...i]
        plain = ""

        # Find index and add 97 if is letter
        for j in 0...cipher.length
            c = cipher[j].downcase
            if letter?(c)
                p = (shift.index(c) + 'a'.ord).chr
                if c != cipher[j]
                    p.upcase!
                end
                plain += p
            else
                plain += c
            end
        end

        possible[plain] = count_english(plain)
    end

    # Sort by highest English word occurrence.
    return possible.sort_by{|k, v| v}.reverse
end

# puts "Ciphertext: " + enCaesar("Hi guys, this is me doing some encryption. Hope you are enjoying the lesson god bless, keep calm and play overwatch piu piu piu", 3)
# puts "\nPlaintext: "
# puts deCaesar("Kl jxbv, wklv lv ph grlqj vrph hqfubswlrq. Krsh brx duh hqmrblqj wkh ohvvrq jrg eohvv, nhhs fdop dqg sodb ryhuzdwfk slx slx slx")