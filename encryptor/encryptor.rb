class Encryptor
  class << self
    def cipher(rot)
      chars = supported_characters
      rotated_chars = chars.rotate(rot)
      Hash[chars.zip(rotated_chars)]
    end

    def encrypt(string, rot)
      encrypt_table = cipher(rot)
      string.split('').map { |letter| encrypt_table[letter] }.join('')
    end

    def decrypt(string, rot)
      decrypt_table = cipher(-rot)
      string.split('').map { |letter| decrypt_table[letter] }.join('')
    end

    def cycle_encrypt(string)
      flag = 1
      resp = []
      string.split('').each do |letter|
        if flag == 1
          resp << Encryptor.encrypt(letter, 13)
          flag = 2
        elsif flag == 2
          resp << Encryptor.encrypt(letter, 22)
          flag = 3
        elsif flag == 3
          resp << Encryptor.encrypt(letter, 34)
          flag = 1
        end
      end
      resp.join('')
    end

    def cycle_decrypt(string)
      flag = 1
      resp = []
      string.split('').each do |letter|
        if flag == 1
          resp << Encryptor.decrypt(letter, 13)
          flag = 2
        elsif flag == 2
          resp << Encryptor.decrypt(letter, 22)
          flag = 3
        elsif flag == 3
          resp << Encryptor.decrypt(letter, 34)
          flag = 1
        end
      end
      resp.join('')
    end

    def encrypt_file(filename, rot)
      file = File.open(filename, 'r')
      input = file.read
      encrypted_input = encrypt(input, rot)
      encrypted_file = File.open("#{filename}.encrypted", 'w')
      encrypted_file.write(encrypted_input)
    end

    def decrypt_file(filename, rot)
      file = File.open(filename, 'r')
      input = file.read
      decrypted_input = decrypt(input, rot)
      decrypted_file = File.open("#{filename}.decrypted", 'w')
      decrypted_file.write(decrypted_input)
    end

    def supported_characters
      (' '..'z').to_a
    end

    def crack(message)
      supported_characters.count.times.map do |attempt|
        decrypt(message, attempt)
      end
    end
  end
end
