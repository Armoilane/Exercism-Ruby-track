class AssemblyLine

  SUCCESS_RATE = %w(0 1 1 1 1 0.9 0.9 0.9 0.9 0.8 0.77)
  PRODUCTION_PER_HOUR = 221

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    (@speed * PRODUCTION_PER_HOUR * SUCCESS_RATE[@speed].to_f).round(1)
  end

  def working_items_per_minute
    production_rate_per_hour.to_i / 60
  end

end
