class Microwave

  def initialize(input)
    @minutes, @seconds = input.divmod(100)
  end

  def timer
    overflow, @seconds = @seconds.divmod(60)
    @minutes += overflow
    "%02d:%02d" % [@minutes, @seconds]
  end
  
end