class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    strategy = search_strategy(schedule)
    month_days.each do |day|
      strategy.match(day, weekday)
      break if strategy.stop_searching
    end
    strategy.last_match
  end

  private

  def month_days
    (Date.new(@year, @month, 1)...Date.new(@year, @month, 1).next_month).to_a
  end

  def search_strategy(schedule)
    case schedule
    when :teenth
      DaySearchStrategy::Teenth.new
    when :first
      DaySearchStrategy::NthMatch.new(1)
    when :second
      DaySearchStrategy::NthMatch.new(2)
    when :third
      DaySearchStrategy::NthMatch.new(3)
    when :fourth
      DaySearchStrategy::NthMatch.new(4)
    when :last
      DaySearchStrategy::LastMatch.new
    else
      raise ArgumentError, "Unsupported schedule: #{schedule}"
    end
  end
end

module DaySearchStrategy
  WEEKDAYS_NUMBERS = {
    monday:    1,
    tuesday:   2,
    wednesday: 3,
    thursday:  4,
    friday:    5,
    saturday:  6,
    sunday:    7
  }.freeze

  class Base
    attr_reader :stop_searching, :last_match

    def initialize
      @stop_searching = false
      @last_match = nil
    end

    def match(date, weekday)
      raise 'Not implemented'
    end

    protected

    def weekday_matches?(weekday, day)
      day.cwday == WEEKDAYS_NUMBERS[weekday]
    end
  end

  class Teenth < Base
    def match(date, weekday)
      matches = date.day >= 13 && date.day <= 19 && weekday_matches?(weekday, date)
      return unless matches

      @last_match = date
      @stop_searching = true
    end
  end

  class NthMatch < Base
    def initialize(stop_search_match_number)
      super()
      @stop_search_match_number = stop_search_match_number
      @match_count = 0
    end

    def match(date, weekday)
      return unless weekday_matches?(weekday, date)

      @last_match = date
      @match_count += 1
      @stop_searching = @stop_search_match_number == @match_count
    end
  end

  class LastMatch < Base
    def match(date, weekday)
      @last_match = date if weekday_matches?(weekday, date)
    end
  end
end
