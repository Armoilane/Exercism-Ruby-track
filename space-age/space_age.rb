EARTH_YEAR = 365.25*24*60*60
ORBIT_TIME_MULTIPLIER = { earth: 1,
                          mercury: 0.2408467,
                          venus: 0.61519726,
                          mars: 1.8808158,
                          jupiter: 11.862615,
                          saturn: 29.447498,
                          uranus: 84.016746,
                          neptune: 164.79132
                        }

class SpaceAge

  def initialize(age)
    @age = age
  end

  def year_on(planet)
   EARTH_YEAR * ORBIT_TIME_MULTIPLIER[planet]
  end

  def on_earth
    @age / year_on(:earth)
  end

  def on_mercury
    @age / year_on(:mercury)
  end

  def on_venus
    @age / year_on(:venus)
  end

  def on_mars
    @age / year_on(:mars)
  end

  def on_jupiter
    @age / year_on(:jupiter)
  end

  def on_saturn
    @age / year_on(:saturn)
  end
  
  def on_uranus
    @age / year_on(:uranus)
  end

  def on_neptune
    @age / year_on(:neptune)
  end
end