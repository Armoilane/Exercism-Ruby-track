class Clock
  private

  def initialize(hour: 0, minute: 0)
    @internal_minutes = (hour * 60 + minute).modulo(1440)
  end

  public

  attr_reader :internal_minutes

  def to_s
    hours, minutes = internal_minutes.divmod(60)
    format("%02i:%02i", hours, minutes )
  end

  def +(clock)
    Clock.new(minute: internal_minutes + clock.internal_minutes)
  end

  def -(clock)
    Clock.new(minute: internal_minutes - clock.internal_minutes)
  end

  def ==(clock)
    internal_minutes == clock.internal_minutes
  end

end
