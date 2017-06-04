class Nucleotide
  NUCLEOTIDE_TYPES = %w(A T C G)

  def initialize(dna_strand)
    validate_dna_strand(dna_strand)
    @dna_strand = dna_strand
  end

  def self.from_dna(dna_string)
    new(dna_string.chars)
  end

  def count(nucleotide)
    @dna_strand.count { |n| n == nucleotide  }
  end

  def histogram
    NUCLEOTIDE_TYPES.reduce({}) do |histogram, nucleotide|
      histogram.merge(nucleotide => count(nucleotide))
    end
  end

  private

  def validate_dna_strand(dna_strand)
    invalid_nucleotides = dna_strand.reject { |n| NUCLEOTIDE_TYPES.include?(n) }
    raise ArgumentError unless invalid_nucleotides.empty?
  end
end
