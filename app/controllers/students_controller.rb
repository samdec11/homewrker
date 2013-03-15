class StudentsController < ApplicationController
  def index
    @students = Student.order(:name)
  end
  def new
    @student = Student.new
  end
  def create
    @student = Student.create(params[:student])
    @students = Student.order(:name)
  end
end