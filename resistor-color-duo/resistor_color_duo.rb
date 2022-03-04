BAND = %w(black brown red orange yellow green blue violet grey white)

class ResistorColorDuo
  def self.value(colors)
    digits = colors.map { |color| BAND.index(color) }
    Integer( "%d%d" % digits )
  end
end