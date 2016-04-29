class ClassroomsController < ApplicationController

  def index
    @classrooms = Classroom.all
    respond_with(@classrooms)
  end

  def new
    @classroom = Classroom.new
    respond_with(@classroom)
  end

  def create
    @classroom = Classroom.new(classroom_params)
    @classroom.entry_at = Time.now
    @classroom.save
    respond_with(@classroom)
  end

  private

  def classroom_params
    params.require(:classroom).permit(:student_id, :course_id)
  end
end
