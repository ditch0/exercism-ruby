module Alphametics
  def self.solve(equation)
    variables = extract_variables(equation)
    (0..9).to_a.permutation(variables.count) do |values|
      variables_values = Hash[variables.zip values]
      return variables_values if correct_solution?(equation, variables_values)
    end
    {}
  end

  def self.correct_solution?(equation, variables_values)
    solution = equation.gsub(Regexp.union(variables_values.keys), variables_values)
    return false if solution =~ /(^| )[0]+\d/
    eval(solution)
  end

  def self.extract_variables(equation)
    equation
      .gsub(/\W/, '')
      .chars
      .uniq
  end
end

module BookKeeping
  VERSION = 4
end
