load 'caesar.rb'
load 'vigenere.rb'
load 'vernam.rb'
load 'utility.rb'

type = nil

while type != 4
    begin
        puts "--- CIPHER MENU ---"
        puts "1. Caesar"
        puts "2. Vigenére"
        puts "3. Vernam"
        puts "4. Exit"
        print "Choose a cipher method (1, 2, 3) or exit (4): "
        type = Integer(gets)
    
        mode = nil
    rescue
        puts "Invalid option!"
        retry
    end

    if type == 4
        abort("Bye!")
    end
    
    while mode != 'E' && mode != 'D'
        print "Do you want to encrypt (E) or decrypt (D)? "
        mode = gets.chomp.upcase[0]
        message = ""
        if mode == 'E'
            print "Enter a message to encode: "
            message = gets.chomp
            puts "Encrypting your message..."
        elsif mode == 'D'
            print "Enter a message to decode: "
            message = gets.chomp
            puts "Decrypting your message..."
        else
            puts "Invalid option!"
        end
    end
    
    case type
    when 1
        puts "CAESAR CIPHER"
        if mode == 'E'
            begin
                print "How many letters would you like to shift (max. 26)? "
                shift = Integer(gets)
            rescue
                puts "Invalid input!"
                retry
                end
            puts "Ciphertext:\t" + enCaesar(message, shift)
        elsif mode == 'D'
            puts "Possible plaintexts in order of likelihood:\t"
            possible = deCaesar(message)
            for i in 0...possible.length
                puts "#{(i+1)}. #{possible[i][0]}"
            end
        end
    when 2
        puts "VIGENÉRE CIPHER"
        print "Please provide a keyword: "
        keyword = gets.chomp
        if mode == 'E'
            puts "Ciphertext:\t" + enVigenere(message, keyword)
        elsif mode == 'D'
            puts "Plaintext:\t" + deVigenere(message, keyword)
        end
    when 3
        puts "VERNAM CIPHER"
        if mode == 'E'
            result = enVernam(message)
            puts "Ciphertext:\t" + result[0].join(" ")
            vernam_key = result[1]
            puts "Key:\t\t" + vernam_key.join(" ")
            puts "Please store your Vernam key safely for future decryption!"
        elsif mode == 'D'
            print "Please provide your key: "
            key = gets.chomp

            if message.length == key.length
                result = deVernam(message, key)
                puts "Plaintext:\t" + deVernam(message, key)
            else
                puts "Invalid key or message."
            end
        end
    end
end