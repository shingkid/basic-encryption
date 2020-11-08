# @param [String] plain
# @return [Array] key
def generate_key(plain)
    key = []
    for i in 0...plain.length
        key << rand('a'.ord...'z'.ord).to_s(2)
    end
    return key
end

# @param [String] plain
# @return [Array]
def enVernam(plain)
    bin_key = generate_key(plain)
    n = bin_key.length
    # puts "\nBinary key:\n" + bin_key.join(" ")
    bin_plain = plain.unpack('U*')
    for i in 0...plain.length
        bin_plain[i] = bin_plain[i].to_s(2)
    end
    # puts "\nBinary plaintext:\n" + bin_plain.join(" ")

    cipher = []
    for i in 0...n
        p = bin_plain[i]
        k = bin_key[i]
        c = ""
        while p.length < 7
            p = '0' + p
        end
        for j in 0...7
            c += (p[j].to_i ^ k[j].to_i).to_s
        end
        cipher << c
    end

    # puts "\nCiphertext:"
    return [cipher, bin_key]
end

def deVernam(cipher, key)
    cipher = to_arr(cipher)
    key = to_arr(key)
    n = key.length

    plain = ""
    for i in 0...n
        c = cipher[i]
        k = key[i]
        p = ""
        for j in 0...7
            p += (c[j].to_i ^ k[j].to_i).to_s
        end

        plain += p.to_i(2).chr
    end
    return plain
end

# puts "Encrypting 'An example of Vernam Cipher.'..."
# encrypted = enVernam("An example of Vernam Cipher.")
# puts encrypted[0].join(" ")
#
# puts "\nDecrypting..."
# puts deVernam(encrypted[0], encrypted[1])