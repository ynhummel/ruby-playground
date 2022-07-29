class Encryptor
  attr_reader :rot

  def initialize(rotation)
    @rot = rotation
  end

  def encrypt_table
    cipher_table(rot)
  end

  def decrypt_table
    cipher_table(-rot)
  end

  def cipher_table(rot)
    chars = (' '..'z').to_a
    rotated_chars = chars.rotate(rot)
    Hash[chars.zip(rotated_chars)]
  end

  def encrypt(string)
    string.split('').map { |letter| encrypt_table[letter] }.join('')
  end

  def decrypt(string)
    string.split('').map { |letter| decrypt_table[letter] }.join('')
  end

  def encrypt_file(filename)
    file = File.open(filename, 'r')
    input = file.read
    encrypted_input = encrypt(input)
    encrypted_file = File.open("#{filename}.encrypted", 'w')
    encrypted_file.write(encrypted_input)
  end

  def decrypt_file(filename)
    file = File.open(filename, 'r')
    input = file.read
    decrypted_input = decrypt(input)
    decrypted_file = File.open("#{filename}.decrypted", 'w')
    decrypted_file.write(decrypted_input)
  end
end
