module ETL
  module_function

  def transform(old)
    old.each_with_object({}) do |(score, letters), memo|
      letters.each do |letter|
        memo[letter.downcase] = score
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
