require 'rails_helper'

RSpec.describe Classroom, type: :model do
  it { is_expected.to belong_to :student }
  it { is_expected.to belong_to :course }
  it { is_expected.to validate_presence_of :student_id }
  it { is_expected.to validate_presence_of :course_id }
end
