class Array
  def keep
    filter { |e| yield(e) }
  end

  def discard
    filter { |e| !yield(e) }
  end

  private

  def filter
    result = []
    each do |e|
      result << e if yield(e)
    end
    result
  end
end
