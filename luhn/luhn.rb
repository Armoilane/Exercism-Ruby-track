module Luhn

  def self.valid?(id_string)
    is_digits_only?(id_string) &&
    id_string.length > 1 &&
    luhn_algorithm?(id_string)
  end

  def self.is_digits_only?(id_string)
    id_string.chars.all?(/[0-9]|\ /) && id_string.chars.first.match?(/[0-9]/)
  end

  def self.luhn_algorithm?(id_string)
    id_string.chars.select { |char| char.match?(/[0-9]/) }
      .map(&:to_i)
      .reverse
      .each_with_index
      .map { |n, i| i.odd? ? calc(n) : n }
      .sum % 10 == 0
  end

  def self.calc(n)
    n*2 > 9 ? n*2-9 : n*2
  end

end
