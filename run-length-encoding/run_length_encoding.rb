class RunLengthEncoding
  def self.encode(input)
    input.gsub(/(.)\1+/) do |group|
      pack(group)
    end
  end

  def self.decode(input)
    input.gsub(/\d+\D/) do |group|
      unpack(group)
    end
  end

  def self.pack(group)
    count = group.length
    character = group[0]
    "#{count}#{character}"
  end

  def self.unpack(group)
    count = group[0...-1].to_i
    character = group[-1]
    character * count
  end

  private_class_method :pack, :unpack
end

module BookKeeping
  VERSION = 2
end
