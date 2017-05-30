class Clock
  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = (hours + minutes / 60) % 24
    @minutes = minutes % 60
  end

  def +(minutes_to_add)
    self.class.at(@hours, @minutes + minutes_to_add)
  end

  def to_s
    format('%02d:%02d', @hours, @minutes)
  end

  def ==(other)
    @hours == other.hours && @minutes == other.minutes
  end

  def self.at(hours, minutes)
    new(hours, minutes)
  end
end

module BookKeeping
  VERSION = 2
end
