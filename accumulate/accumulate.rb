class Array
  def accumulate
    result = []
    for element in self
      result << yield(element)
    end
    result
  end
end

module BookKeeping
  VERSION = 1
end
