class Grains
  def self.square(n)
    raise ArgumentError unless (1..64).include?(n)
    2**(n-1)
  end

  def self.total
    (1..64).reduce(0) { |total, n| total + square(n) }
  end
end