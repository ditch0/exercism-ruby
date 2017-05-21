class BeerSong
  def verse(bottles_count)
    first_line(bottles_count) + "\n" + second_line(bottles_count) + "\n"
  end

  def verses(from, to)
    verses = from.downto(to).map do |bottles_count|
      verse(bottles_count)
    end
    verses.join("\n")
  end

  private

  def first_line(bottles_count)
    how_many_bottles = bottles_count_to_string(bottles_count)
    "#{how_many_bottles.capitalize} of beer on the wall, #{how_many_bottles} of beer."
  end

  def second_line(bottles_count)
    pronoun_for_one = bottles_count == 1 ? 'it' : 'one'
    bottles_count_after = bottles_count > 0 ? bottles_count - 1 : 99
    how_many_bottles = bottles_count_to_string(bottles_count_after)
    ''.tap do |s|
      s << (bottles_count.zero? ? 'Go to the store and buy some more' : "Take #{pronoun_for_one} down and pass it around")
      s << ', '
      s << "#{how_many_bottles} of beer on the wall."
    end
  end

  def bottles_count_to_string(bottles_count)
    ''.tap do |s|
      s << (bottles_count.zero? ? 'no more' : bottles_count.to_s)
      s << ' '
      s << pluralize('bottle', bottles_count)
    end
  end

  def pluralize(word, count)
    count == 1 ? word : "#{word}s"
  end
end

module BookKeeping
  VERSION = 3
end
