module Atbash

  ALPHABET = ('a'..'z').to_a.join.freeze

  def self.encode(text)
    text.downcase.tr('^a-z0-9', '')
      .tr(ALPHABET, ALPHABET.reverse)
      .scan(/.{1,5}/).join(' ')
  end

  def self.decode(text)
    text.scan(/[a-z]|\d/).join.tr(ALPHABET.reverse, ALPHABET)
  end

end
