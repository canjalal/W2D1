class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new {|h, k| h[k] = []}
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    return false if @students.size == @student_capacity

    @students << student

    return true
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    (@students.size / @teachers.size)
  end

  def add_grade(student, grade)
    return false if !@students.include?(student)

    @grades[student] << grade

    true
  end

  def num_grades(student)
    @grades[student].size
  end

  def average_grade(student)
    return nil if @grades[student].size == 0

    return @grades[student].sum/@grades[student].size
  end
end

# bootcamp1 = Bootcamp.new("Shiny Camp", "We are the shiny bootcamp!", 18)

# bootcamp1.hire("Old Macdonald")

# bootcamp1.enroll("Sammy Sam")

# p bootcamp1.average_grade("Sammy Sam")
