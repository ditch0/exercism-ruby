Anagram = Struct.new(:word) do
  def match(candidates)
    candidates.select { |c| anagram?(c) }
  end

  private

  def anagram?(candidate)
    !word.casecmp(candidate).zero? && letters(word) == letters(candidate)
  end

  def letters(word)
    word.split(//).map(&:downcase).sort
  end
end

module BookKeeping
  VERSION = 2
end
