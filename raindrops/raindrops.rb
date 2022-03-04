module Raindrops
  SOUNDS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze

  def self.convert(number)
    conversion = dropsounds(number)
    conversion.empty? ? number.to_s : conversion
  end

  private

  def self.dropsounds(number)
    SOUNDS.map { |prime, sound| sound if number % prime == 0 }.join
  end

end
