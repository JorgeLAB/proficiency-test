require 'rails_helper'

RSpec.describe "courses/new", type: :view do
  before(:each) do
    assign(:course, build(:course))
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do

      assert_select "input#course_name[name=?]", "course[name]"

      assert_select "textarea#course_description[name=?]", "course[description]"

      assert_select "select#course_status[name=?]", "course[status]"
    end
  end
end
