require "test/unit"
require_relative "../encryptor.rb"

class EncryptorTest < Test::Unit::TestCase
  def test_encrypt
    assert_equal(Encryptor.encrypt("Hello World!", 11), "Spwwz+bz\"wo,")
  end

  def test_decrypt
    assert_equal(Encryptor.decrypt("Spwwz+bz\"wo,", 11), "Hello World!")
  end
end
