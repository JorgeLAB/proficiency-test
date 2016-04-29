require 'rails_helper'

RSpec.describe "classrooms/new.html.slim", type: :view do
  let(:course) { create :course }
  let(:student) { create :student }

  before(:each) do
    assign(:classroom, build(:classroom, student: student, course: course ))
  end

  it "renders new classroom form" do
    render

    assert_select "form[action=?][method=?]", classrooms_path, "post" do
      assert_select "select#classroom_student_id[name=?]", "classroom[student_id]"

      assert_select "select#classroom_course_id[name=?]", "classroom[course_id]"
    end
  end
end
