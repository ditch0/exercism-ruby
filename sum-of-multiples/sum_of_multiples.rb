require 'set'

class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def to(limit)
    unique_multiples = @numbers.reduce(Set.new) do |multiples, number|
      multiples_of_number = multiples_of(number, limit)
      multiples.merge(multiples_of_number)
    end
    unique_multiples.sum
  end

  private

  def multiples_of(number, limit)
    multiples = Set.new
    current_multiple = number
    loop do
      break if current_multiple >= limit
      multiples << current_multiple
      current_multiple += number
    end
    multiples
  end

end
