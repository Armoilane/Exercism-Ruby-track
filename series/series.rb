class Series

  def initialize(string)
    @string = string
  end

  def slices(size)
    raise ArgumentError unless size <= @string.length
    @string.each_char.each_cons(size).map(&:join)
  end

end


if defined? MiniTest

  describe 'User augmented tests' do

    it 'might work on letters too?' do
      series = Series.new('abc')
      assert_equal ['a','b','c'], series.slices(1)
    end

  end

end
