class Phrase

  attr_reader :word_count

  def initialize(phrase)
    @word_count = count_words(phrase)
  end

  private

    def count_words(phrase)
      words = phrase.downcase.scan(/\b[\w']+\b/)
      words.group_by(&:itself).transform_values(&:count)
    end

end