class Isogram

  def self.isogram?(word)
    processed_string = word.downcase.scan(/[a-zA-Z]/)
    processed_string == processed_string.uniq
  end

end
