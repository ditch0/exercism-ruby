class Phrase
  VERSION = 1

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.split(/[^\w']+/)
    words.reduce(Hash.new(0)) do |counts, word|
      word = Phrase.normalize_word(word)
      counts[word] += 1
      counts
    end
  end

  private
  def self.normalize_word(word)
    word.downcase.gsub(/^'|'$/, '')
  end
end