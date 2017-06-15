class Say
  WORDS_FOR_NUMBERS = {
    0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five',
    6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten',
    11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen',
    16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen',
    20 => 'twenty', 30 => 'thirty', 40 => 'forty', 50 => 'fifty', 60 => 'sixty',
    70 => 'seventy', 80 => 'eighty', 90 => 'ninety'
  }.freeze

  def initialize(number)
    raise ArgumentError unless valid_number?(number)
    @number = number
  end

  def in_english
    parts = []

    if @number >= 1_000_000_000
      parts << Say.new(@number / 1_000_000_000).in_english + ' billion'
      parts << Say.new(@number % 1_000_000_000).in_english
    elsif @number >= 1_000_000
      parts << Say.new(@number / 1_000_000).in_english + ' million'
      parts << Say.new(@number % 1_000_000).in_english
    elsif @number >= 1_000
      parts << Say.new(@number / 1_000).in_english + ' thousand'
      parts << Say.new(@number % 1_000).in_english
    elsif @number >= 100
      parts << Say.new(@number / 100).in_english + ' hundred'
      parts << Say.new(@number % 100).in_english
    elsif @number > 0
        parts << if @number % 100 < 20
                   WORDS_FOR_NUMBERS[@number % 100]
                 else
                   rest = (@number % 100) % 10
                   WORDS_FOR_NUMBERS[(@number % 100) / 10 * 10] + (rest > 0 ? "-#{WORDS_FOR_NUMBERS[rest]}" : '')
                 end
    end

    parts.reject!(&:empty?)
    parts.reject! { |e| e == 'zero' }
    parts << 'zero' if parts.empty?
    parts.join(' ')
  end

  private

  def valid_number?(number)
    number >= 0 && number <= 999_999_999_999
  end
end

module BookKeeping
  VERSION = 1
end
