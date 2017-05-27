class SpaceAge
  planets_orbital_periods = {
    earth:   1,
    mercury: 0.2408467,
    venus:   0.61519726,
    mars:    1.8808158,
    jupiter: 11.862615,
    saturn:  29.447498,
    uranus:  84.016846,
    neptune: 164.79132
  }

  planets_orbital_periods.each do |planet, period|
    define_method "on_#{planet}" do
      @age_in_seconds / 60 / 60 / 24 / 365.25 / period
    end
  end

  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end
end

module BookKeeping
  VERSION = 1
end
