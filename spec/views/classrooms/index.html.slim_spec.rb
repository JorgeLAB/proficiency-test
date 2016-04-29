require 'rails_helper'

RSpec.describe "classrooms/index.html.slim", type: :view do
  let(:course) { create :course }
  let(:student) { create :student }
  let(:classroom) { create_list(:classroom, 2, { student: student, course: course }) }

  before(:each) do
    assign(:classrooms, classroom)
  end

  it "renders a list of classrooms" do
    render
    assert_select "tr>td", :text => classroom[0].student.name, :count => 2
    assert_select "tr>td", :text => classroom[0].course.name, :count => 2
    assert_select "tr>td", :text => l(classroom[0].entry_at, format: t('time.formats.slashed')), :count => 2
  end
end
