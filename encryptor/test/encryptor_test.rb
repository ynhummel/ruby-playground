require "test/unit"
require_relative "../encryptor.rb"

class EncryptorTest < Test::Unit::TestCase
  def test_encrypt
    input = Encryptor.encrypt("Hello World!", 11)
    output = "Spwwz+bz\"wo,"

    assert_equal(input, output)
  end

  def test_decrypt
    input = Encryptor.decrypt("Spwwz+bz\"wo,", 11)
    output = "Hello World!"

    assert_equal(input, output)
  end

  def test_cycle_encrypt
    input = Encryptor.cycle_encrypt("Hello World!")
    output = "U 3y*Bd*9yzC"

    assert_equal(input, output)
  end

  def test_cycle_decrypt
    input = Encryptor.cycle_decrypt("U 3y*Bd*9yzC")
    output = "Hello World!"

    assert_equal(input, output)
  end
end
