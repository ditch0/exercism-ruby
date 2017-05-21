class Pangram
  ALPHABET = ('a'..'z').to_a

  def self.pangram?(string)
    used_letters = string
                .downcase
                .gsub(/[^a-z]+/, '')
                .chars
    missing_letters = ALPHABET - used_letters
    missing_letters.empty?
  end
end

module BookKeeping
  VERSION = 4
end
