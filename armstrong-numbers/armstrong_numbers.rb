class ArmstrongNumbers

  def self.include?(integer)
    digits = integer.digits
    power = digits.size
    integer == digits.map { |digit| digit ** power }.sum
  end

end
