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
        enrolled_students = @students.length
        if enrolled_students < @student_capacity
            @students << student 
            return true
        else
            return false
        end
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if @students.include?(student)
            @grades[student] << grade 
            return true 
        else
            return false 
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        return nil if @grades[student].length == 0 || !@students.include?(student)
        @grades[student].sum / @grades[student].length
    end
end
