class StudentsController < ApplicationController

  def index
    # byebug
    if !params[:name]

      students = Student.all
      render json: students
    else

      # student_last = Student.find_by(last_name: params[:name].capitalize)
      student_last = Student.where("last_name = ?", params[:name])


      student_first = Student.find_by(first_name: params[:name].capitalize)

      if student_first
        render json: student_first
      else
        render json: student_last
      end

    end
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
