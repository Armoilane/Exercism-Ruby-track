class Squares

  def initialize(num)
    @square_of_sum = (1..num).sum ** 2
    @sum_of_squares = (1..num).map { |n| n ** 2 }.sum
    @difference = @square_of_sum - @sum_of_squares
  end

  attr_reader :square_of_sum,
              :sum_of_squares,
              :difference

end
