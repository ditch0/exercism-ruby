# to_roman mixin for Fixnum
class Fixnum
  VERSION = 1
  SYMBOLS_FOR_NUMBER_POSITION = {
      0 => ['I', 'V', 'X'],
      1 => ['X', 'L', 'C'],
      2 => ['C', 'D', 'M'],
      3 => ['M', 'V\'', 'X\'']
  }.freeze

  def to_roman
    value_in_roman = ''
    to_s.split(//).reverse.each_with_index do |number, index|
      symbols = SYMBOLS_FOR_NUMBER_POSITION[index]
      unless symbols.nil?
        value_in_roman = make_roman_number(number.to_i, *symbols) + value_in_roman
      end
    end
    value_in_roman
  end

  private

  def make_roman_number(value, one_symbol, five_symbol, ten_symbol)
    return ten_symbol if value == 10
    base_symbol = case value % 10
                    when 9 then ten_symbol
                    when 4..8 then five_symbol
                    else ''
                  end
    value % 5 == 4 ? one_symbol + base_symbol : base_symbol + one_symbol * (value % 5)
  end
end