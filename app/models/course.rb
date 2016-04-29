class Course < ActiveRecord::Base

  validates_presence_of :name
  validates_numericality_of :status, { only_integer: true, greater_than_or_equal_to: 1 }

end
