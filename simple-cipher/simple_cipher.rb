class Cipher
  private
  ALPHABET = ('a'..'z').to_a

  def initialize(key = generate_key)
    @key = validated(key)
  end

  def validated(key)
    raise ArgumentError unless key.match?(/\A[a-z]+\z/)
    key
  end

  def generate_key
    Array.new(100) { rand(97..122).chr }.join
  end

  def indexes(phrase)
    phrase.chars.map(&ALPHABET.method(:index))
  end

  def shift(phrase, operation)
    indexes(phrase).zip(indexes(key)).reduce('') do |memo, (char_idx, key_idx)|
      memo + ALPHABET[char_idx.send(operation, key_idx) % 26]
    end
  end

  public

  attr_reader :key

  Hash[:encode, :+, :decode, :-].each do |name, operation|
    define_method(name) { |phrase| shift(phrase, operation) }
  end

end
