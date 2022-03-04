class Triangle

  def initialize(sides)
    @a, @b, @c = [sides[0], sides[1], sides[2]].sort
  end

  def equilateral?
    is_a_triangle? &&
    @a == @b && @b == @c
  end

  def isosceles?
    is_a_triangle? &&
    (@a == @b || @b == @c || @a == @c)
  end

  def scalene?
    is_a_triangle? &&
    @a != @b && @b != @c && @a != @c
  end

  def is_a_triangle?
    no_side_is_zero? && inequality?
  end

  def no_side_is_zero?
    @a > 0 && @b > 0 && @c > 0
  end

  def inequality?
    (@a + @b) <= @c
  end

  def degenerate?
    @a + @b == @c ||
    @b + @c == @a ||
    @c + @a == @b
  end

end

if defined? MiniTest

  describe  'User augmented tests' do

    it 'correctly checks that no side is zero' do
      expected = false

      triangle1 = Triangle.new([1, 1, 0])
      expect(triangle1.no_side_is_zero?).must_equal expected

      triangle2 = Triangle.new([1, 0, 1])
      expect(triangle2.no_side_is_zero?).must_equal expected

      triangle3 = Triangle.new([0, 1, 1])
      expect(triangle3.no_side_is_zero?).must_equal expected
    end

    it 'correctly assesses triangle inequality to be false' do
      expected = false

      triangle1 = Triangle.new([1, 1, 3])
      expect(triangle1.inequality?).must_equal expected

      triangle2 = Triangle.new([1, 3, 1])
      expect(triangle2.inequality?).must_equal expected

      triangle3 = Triangle.new([3, 1, 1])
      expect(triangle3.inequality?).must_equal expected
    end

    it 'identifies a degenerate triangle' do
      expected = true

      triangle1 = Triangle.new([1, 1, 2])
      expect(triangle1.degenerate?).must_equal expected

      triangle2 = Triangle.new([1, 2, 1])
      expect(triangle2.degenerate?).must_equal expected

      triangle3 = Triangle.new([2, 1, 1])
      expect(triangle3.degenerate?).must_equal expected
    end

  end

end
