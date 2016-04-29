require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  let(:courses) { create_list :course, 2 }

  before(:each) do
    assign(:courses, courses)
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => courses[0][:name].to_s, :count => 1
    assert_select "tr>td", :text => courses[1][:name].to_s, :count => 1
    assert_select "tr>td", :text => courses[0][:description].to_s, :count => 2
    assert_select "tr>td", :text => Status.t(courses[0][:status]), :count => 2
  end
end
