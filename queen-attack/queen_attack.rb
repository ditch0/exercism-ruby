class Queens
  def initialize(white: nil, black: nil)
    @white = BoardPosition.new(*white) unless white.nil?
    @black = BoardPosition.new(*black) unless black.nil?
  end

  def attack?
    @white.on_same_line?(@black)
  end
end

class BoardPosition
  attr_reader :x, :y

  def initialize(x, y)
    raise ArgumentError, "Invalid position: [#{x}, #{y}]" \
      unless valid_axis_position?(x) && valid_axis_position?(y)

    @x = x
    @y = y
  end

  def on_same_column?(other_position)
    x == other_position.x
  end

  def on_same_row?(other_position)
    y == other_position.y
  end

  def on_same_diagonal?(other_position)
    (x - other_position.x).abs == (y - other_position.y).abs
  end

  def on_same_line?(other_position)
    on_same_column?(other_position) || on_same_row?(other_position) || on_same_diagonal?(other_position)
  end

  def valid_axis_position?(value)
    value >= 0 && value <= 7
  end
end

module BookKeeping
  VERSION = 2
end
