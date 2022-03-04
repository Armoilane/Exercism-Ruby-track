class Anagram

  private

    def initialize(subject)
      @subject_chars = processed(subject)
    end

    def processed(word)
      word.downcase.chars
    end

    def anagram?(candidate)
      candidate_chars = processed(candidate)
      !same_word?(candidate_chars) && same_chars?(candidate_chars)
    end

    def same_word?(candidate_chars)
      @subject_chars == candidate_chars
    end

    def same_chars?(candidate_chars)
      @subject_chars.sort == candidate_chars.sort
    end

  public

    def match(word_list)
      word_list.select { |candidate| anagram?(candidate) }
    end

end
