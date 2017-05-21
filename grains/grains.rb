class Grains
  SQUARES_COUNT = 64

  def self.square(square_number)
    2 ** (square_number - 1)
  end

  def self.total
    (1..SQUARES_COUNT).reduce(0) { |sum, square_number| sum + square(square_number) }
  end
end