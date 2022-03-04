
class Pangram
  ALPHABET = ('a'..'z').to_a.join

  def self.pangram?(sentence)
    isnt_empty(sentence) && chars_are_unique(sentence)
  end

  def self.chars_are_unique(sentence)
    ALPHABET.delete(processed_sentence(sentence)).empty?
  end
  
  def self.isnt_empty(sentence)
    !processed_sentence(sentence).empty?
  end

  def self.processed_sentence(sentence)
    select_only_alphabet(sentence).join
  end

  def self.select_only_alphabet(sentence)
    sentence.downcase.chars.select { |c| ALPHABET.include?(c) }
  end

end