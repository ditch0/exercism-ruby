class Series
  def initialize(sequence)
    @sequence = sequence
  end

  def slices(length)
    raise ArgumentError if length > @sequence.length

    [].tap do |slices|
      loop.with_index do |_, i|
        slice_start = i
        slice_end = slice_start + length - 1

        break unless slice_end < @sequence.length

        slices << @sequence[slice_start..slice_end]
      end
    end
  end
end
