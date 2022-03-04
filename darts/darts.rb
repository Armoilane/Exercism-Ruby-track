class Darts

  def initialize(x,y)
    @x = x
    @y = y
  end
  
  def score
    r = Math.hypot(@x,@y)
    r <= 1 ? 10 : r <= 5 ? 5 : r <= 10 ? 1 : 0;
  end

end