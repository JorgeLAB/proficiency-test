require 'rails_helper'

RSpec.describe "classrooms/show", type: :view do
  let(:course) { create :course }
  let(:student) { create :student }

  before(:each) do
    @classroom = assign(:classroom, create(:classroom, student: student, course: course ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@classroom.student.name}/)
    expect(rendered).to match(/#{@classroom.course.name}/)
    expect(rendered).to match(/#{l(@classroom.entry_at, format: t('time.formats.slashed'))}/)
  end
end
