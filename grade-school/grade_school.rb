Student = Struct.new(:name, :grade)

class School
  def initialize
    @students = []
  end

  def students(which_grade)
    @students
      .select { |s| s.grade == which_grade }
      .map(&:name)
      .sort
  end

  def add(student_name, student_grade)
    @students << Student.new(student_name, student_grade)
  end

  def students_by_grade
    grades.map do |g|
      {
        grade: g,
        students_by_grades: students(g)
      }
    end
  end

  private

  def grades
    @students
      .map(&:grade)
      .uniq
      .sort
  end
end

module BookKeeping
  VERSION = 3
end
