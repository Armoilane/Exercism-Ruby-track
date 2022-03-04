class Sieve

  def initialize(limit)
    @limit = limit
    @range = (2..limit).to_a
  end

  def primes
    @range.each do |prime|
      i = 0
      n = 0
      nonprimes = []

      until n >= @limit do
        n = 2*prime + i*prime
        @range.delete(n)
        i += 1
      end

    end
  end

end
