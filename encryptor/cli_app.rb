require_relative './encryptor'
require 'digest'

def wrong_pass
  puts 'Wrong password, exiting program!'
  exit
end

print 'Password: '
pass = gets.chomp
hashed_pass = Digest::SHA256.hexdigest(pass)
wrong_pass if hashed_pass != "d0c278cfad79b02c45450c3e88e4206ee6e046c30655306c045c5c056676cf07"

puts 'Escolha a opção:'
puts '1 - Encrypt'
puts '2 - Cycle Encrypt'
puts '3 - Decrypt'
puts '4 - Cycle Decrypt'
puts '5 - Sair'

def encrypt
  system('clear')
  puts 'Digite a mensagem a ser criptografada'
  msg = gets.chomp

  puts 'Número de rotações: '
  rot = gets.chomp

  puts "#{Encryptor.encrypt(msg, rot.to_i)}".inspect
end

def decrypt
  system('clear')
  puts 'Digite a mensagem a ser descriptografada'
  msg = gets.chomp

  puts 'Número de rotações: '
  rot = gets.chomp

  puts "#{Encryptor.decrypt(msg, rot.to_i)}".inspect
end

def cycle_encrypt
  system('clear')
  puts 'Digite a mensagem a ser criptografada'
  msg = gets.chomp

  puts "#{Encryptor.cycle_encrypt(msg)}".inspect
end

def cycle_decrypt
  system('clear')
  puts 'Digite a mensagem a ser descriptografada'
  msg = gets.chomp

  puts "#{Encryptor.cycle_decrypt(msg)}".inspect
end

option = 0

while option != 3
  option = gets.chomp.to_i

  case option
  when 1
    encrypt
  when 2
    cycle_encrypt
  when 3
    decrypt
  when 4
    cycle_decrypt
  when 5
    exit
  else
    'Opção inválida'
  end
end
