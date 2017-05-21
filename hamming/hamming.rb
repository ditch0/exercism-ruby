class Hamming

  VERSION = 1

  def self.compute(dna1, dna2)
    raise(ArgumentError, 'DNAs have different sizes') if dna1.length != dna2.length
    return dna1.length.times.count { |i| dna1[i] != dna2[i] }
  end
end
