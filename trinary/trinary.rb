class Trinary
  def initialize(value)
    @value = valid_value?(value) ? value : nil
  end

  def to_decimal
    return 0 if @value.nil?

    digits = @value.chars.reverse.map(&:to_i)
    digits.each_with_index.inject(0) do |decimal_value, (digit, index)|
      decimal_value + digit * 3**index
    end
  end

  private

  def valid_value?(value)
    !(value =~ /\A[0-2]+\z/).nil?
  end
end

module BookKeeping
  VERSION = 1
end
