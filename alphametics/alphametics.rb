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
      variables_values = Hash[variables.zip values]
      return variables_values if correct_solution?(variables_values)
    end
    {}
  end

  def correct_solution?(variables_values)
    solution = equation.gsub(variables_regexp, variables_values)
    return false if solution =~ /(^| )[0]+\d/
    eval(solution)
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

  def variables_regexp
    @variables_regexp ||= Regexp.union(variables)
  end
end

module BookKeeping
  VERSION = 4
end
