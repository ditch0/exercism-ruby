module PrimeFactors
  def self.for(number)
    factors = []
    divisor = 2
    while divisor <= number
      if (number % divisor).zero?
        factors << divisor
        number /= divisor
      else
        divisor += 1
      end
    end
    factors
  end
end
