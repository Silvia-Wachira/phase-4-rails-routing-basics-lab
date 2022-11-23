class StudentsController < ApplicationController
    def index
        students = Student.all
        render json: students
    end

    def grades
        students = order_students
        render json: students
    end

    def highest_grade
        student = order_students.limit(1)
        render json: student.first
    end

    private

    def order_students
        Student.all.order(grade: :desc)
    end
end
