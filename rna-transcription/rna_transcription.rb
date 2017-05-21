class Complement

  VERSION = 2.freeze
  DNA_TO_RNA = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }.freeze
  RNA_TO_DNA = DNA_TO_RNA.invert.freeze

  def self.of_dna(dna)
    self.transform_string_by_hash(dna, DNA_TO_RNA)
  end

  def self.of_rna(rna)
    self.transform_string_by_hash(rna, RNA_TO_DNA)
  end

private

  def self.transform_string_by_hash(string, hash)
      nucleotides = string.split(//).map do |n|
        raise(ArgumentError, "Unknown nucleotide #{n}") unless hash.has_key?(n)
        hash[n]
      end
      nucleotides.join('')
  end

end