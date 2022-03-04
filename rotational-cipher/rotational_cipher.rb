module RotationalCipher

  LOWERCASE_APLHABET = ('a'..'z').to_a.freeze
  UPPERCASE_APLHABET = ('A'..'Z').to_a.freeze
  ALPHABET = (UPPERCASE_APLHABET + LOWERCASE_APLHABET).join.freeze

  def self.rotate(message, rotation)
    message.tr(ALPHABET, (UPPERCASE_APLHABET.rotate(rotation) +
                          LOWERCASE_APLHABET.rotate(rotation)).join)
  end

end
