class SpaceAge
  ORBITAL_PERIODS = {
    earth:   1,
    mercury: 0.2408467,
    venus:   0.61519726,
    mars:    1.8808158,
    jupiter: 11.862615,
    saturn:  29.447498,
    uranus:  84.016846,
    neptune: 164.79132
  }.freeze

  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end

  def on_earth
    on_planet(:earth)
  end

  def on_mercury
    on_planet(:mercury)
  end

  def on_venus
    on_planet(:venus)
  end

  def on_mars
    on_planet(:mars)
  end

  def on_jupiter
    on_planet(:jupiter)
  end

  def on_saturn
    on_planet(:saturn)
  end

  def on_uranus
    on_planet(:uranus)
  end

  def on_neptune
    on_planet(:neptune)
  end

  private

  def on_planet(planet)
    @age_in_seconds / 60 / 60 / 24 / 365.25 / ORBITAL_PERIODS[planet]
  end
end

module BookKeeping
  VERSION = 1
end
