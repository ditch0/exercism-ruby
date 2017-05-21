class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    primes = (2..@limit).to_a
    divisors = (2..@limit - 1)

    divisors.each do |divisor|
      primes -= multiples_of(divisor)
    end

    primes
  end

  private

  def multiples_of(number)
    (number * 2).step(@limit, number).to_a
  end
end

module BookKeeping
  VERSION = 1
end
