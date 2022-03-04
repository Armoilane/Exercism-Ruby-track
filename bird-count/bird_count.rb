class BirdCount
  def self.last_week
    @last_week ||= [0, 2, 5, 3, 7, 8, 4]
  end

  def initialize(birds_per_day)
    @last_week = birds_per_day
  end

  def yesterday
    @last_week[-2]
  end

  def total
    @last_week.sum
  end

  def busy_days
    @last_week.count { |daily_count| daily_count >= 5 }
  end

  def day_without_birds?
    @last_week.any?(0)
  end

end
