class Binary
  def self.to_decimal(binary)
    raise ArgumentError unless valid_binary_number?(binary)

    bits = binary.chars.reverse.map(&:to_i)
    decimal = 0
    bits.each_with_index do |value, index|
      bit = value
      power = index
      decimal += bit * 2**power
    end
    decimal
  end

  def self.valid_binary_number?(binary)
    binary.match(/\A[01]+\z/) != nil
  end
end

module BookKeeping
  VERSION = 3
end
