class Robot

  attr_reader :name

  @@used_names = [];

  LETTERS = ('A'..'Z').to_a
  DIGITS = ('0'..'9').to_a

  def initialize
    reset
  end

  def reset
    @name = self.class.generate_unique_name
  end

  private

  def self.generate_unique_name
    while true do
      name = create_random_string(LETTERS, 2) + create_random_string(DIGITS, 3)
      unless (@@used_names.include?(name))
        @@used_names << name
        return name
      end
    end
  end

  def self.create_random_string(characters, length)
    characters.sample(length).join('')
  end

end