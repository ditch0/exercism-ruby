class Alphametics
  attr_reader :equation

  def self.solve(equation)
    new(equation).solve
  end

  def initialize(equation)
    @equation = equation
  end

  def solve
    (0..9).to_a.permutation(variables.count) do |values|
      return Hash[variables.zip values] if correct_solution?(values)
    end
    {}
  end

  private

  def variables
    @variables ||= extract_variables
  end

  def extract_variables
    equation
      .gsub(/\W/, '')
      .chars
      .uniq
  end

  def correct_solution?(values)
    solution = equation.tr(variables.join, values.join)
    return false if solution =~ /(^| )[0]+\d/
    eval(solution)
  end
end

module BookKeeping
  VERSION = 4
end
