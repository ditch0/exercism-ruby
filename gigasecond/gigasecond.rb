
class Gigasecond
  VERSION = 1.freeze
  GIGASECOND = 1_000_000_000.freeze

  def self.from(time)
    time + Gigasecond::GIGASECOND
  end
end