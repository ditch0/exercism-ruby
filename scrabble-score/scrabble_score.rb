class Scrabble
  LETTER_VALUES = {}.tap do |letter_values|
    assign = lambda do |letters, value|
      letters.each { |letter| letter_values[letter] = value }
    end
    [
      [%w(A E I O U L N R S T), 1],
      [%w(D G),                 2],
      [%w(B C M P),             3],
      [%w(F H V W Y),           4],
      [%w(K),                   5],
      [%w(J X),                 8],
      [%w(Q Z),                 10],
    ]
      .each { |a| assign.call(*a) }
  end

  def initialize(word)
    @word = word.nil? ? '' : word
  end

  def score
    @word.chars.reduce(0) do |score, char|
      score + LETTER_VALUES.fetch(char.upcase, 0)
    end
  end

  def self.score(word)
    new(word).score
  end
end
