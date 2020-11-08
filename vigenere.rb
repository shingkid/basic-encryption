def vigenere_tableau
    table = []
    alphabet = ("A".."Z").to_a
    for i in 0...26
        table[i] = alphabet.rotate(i)
    end
    return table
end
$TABLE = vigenere_tableau

def find_row(letter, c)
    for r in 0...26
        return r if $TABLE[r][c] == letter
    end
    return nil
end

def find_col(letter)
    for c in 0...26
        return c if $TABLE[0][c] == letter
    end
    return nil
end

# Keyword: row
# Plaintext: column
def enVigenere(plain, key)
    cipher = ""

    n = plain.length
    while key.length < n
        key += key
    end
    key = key[0...n]

    for i in 0...n
        p = plain[i].upcase
        k = key[i].upcase
        if letter?(p)
            row = find_row(p, 0)
            col = find_col(k)
            cipher += $TABLE[row][col]
            if p != plain[i]
                cipher[-1] = cipher[-1].downcase
            end
        else
            cipher += p
        end
    end

    return cipher
end

# Keyword: column
# Cipher: find letter in that column
def deVigenere(cipher, key)
    plain = ""

    n = cipher.length
    while key.length < n
        key += key
    end
    key = key[0...n]

    for i in 0...n
        c = cipher[i].upcase
        k = key[i].upcase
        if letter?(c)
            col = find_col(k)
            row = find_row(c, col)
            plain += $TABLE[row][0]
            if c != cipher[i]
                plain[-1] = plain[-1].downcase
            end
        else
            plain += c
        end
    end

    return plain
end

# puts "Encrypting 'attack': " + enVigenere("attack", "hot")
# puts "Decrypting 'hhmhqd': " + deVigenere("hhmhqd", "hot")