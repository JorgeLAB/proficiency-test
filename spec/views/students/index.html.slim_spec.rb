require 'rails_helper'

RSpec.describe "students/index", type: :view do
  let(:students) { create_list(:student, 2) }

  before(:each) do
    assign(:students, students )
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => students[0][:name].to_s, :count => 1
    assert_select "tr>td", :text => students[0][:register_number].to_s, :count => 1
    assert_select "tr>td", :text => students[1][:name].to_s, :count => 1
    assert_select "tr>td", :text => students[1][:register_number].to_s, :count => 1
    assert_select "tr>td", :text => Status.t(students[0][:status]), :count => 2
  end
end
