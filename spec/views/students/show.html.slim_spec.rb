require 'rails_helper'

RSpec.describe "students/show", type: :view do
  before(:each) do
    @student = assign(:student, create(:student))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@student[:name]}/)
    expect(rendered).to match(/#{@student[:register_number]}/)
    expect(rendered).to match(/#{@student[:status]}/)
  end
end
