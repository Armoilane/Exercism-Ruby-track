class Matrix

  def initialize(string)
    @rows = string.each_line.map { |line| line.split.map(&:to_i) }
    @columns = rows.transpose
  end

  attr_reader :rows, :columns

end
