class Encryptor
  class << self
    def encrypt_table
      cipher_table(rot)
    end

    def decrypt_table
      cipher_table(-rot)
    end

    def cipher(rot)
      chars = (' '..'z').to_a
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
  end
end
