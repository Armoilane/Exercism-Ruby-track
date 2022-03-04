class SumOfMultiples

  private

    def initialize(*factors)
      @factors = *factors
    end

  public

    attr_reader :factors

    def to(limit)
      return 0 if factors == [0]

      factors.flat_map do |factor|
        (factor...limit).step(factor).to_a
      end.uniq.sum

    end

end
