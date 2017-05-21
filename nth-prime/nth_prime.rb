class Prime

  def self.nth(n)

    raise(ArgumentError, 'n must be greater than zero') unless n > 0

    prime = 0
    n.times do
      loop do
        prime += 1
        break if is_prime(prime)
      end
    end
    prime
  end

  def self.is_prime(n)
    return false if n <= 1
    for i in 2...n do
      return false if n % i == 0
    end
    true
  end

end