class Hexadecimal
  HEXADECIMAL_TO_DECIMAL = Hash[
    %w(0 1 2 3 4 5 6 7 8 9 a b c d e f).each_with_index.map { |hex, dec| [hex, dec] }
  ]

  def initialize(value)
    @value = valid_value?(value) ? value : ''
  end

  def to_decimal
    @value.chars.reverse.each_with_index.reduce(0) do |decimal_value, (digit, index)|
      decimal_value + HEXADECIMAL_TO_DECIMAL[digit] * 16**index
    end
  end

  private

  def valid_value?(value)
    !(value =~ /^[0-9a-f]+$/).nil?
  end
end
