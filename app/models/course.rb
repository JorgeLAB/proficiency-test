class Course < ActiveRecord::Base

  has_many :classrooms

  validates_presence_of :name
  validates_numericality_of :status, { only_integer: true, greater_than_or_equal_to: 1 }

  has_enumeration_for :status, with: Status, create_helpers: true

end
