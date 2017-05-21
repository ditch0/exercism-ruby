class Game
  attr_reader :score

  def initialize
    @score = 0
    @prev_pins = 0
    @double_next_pins = false
  end

  def roll(pins)
    @score += pins * (@double_next_pins ? 2 : 1)
    @double_next_pins = pins + @prev_pins >= 10

    @prev_pins = pins
  end
end
