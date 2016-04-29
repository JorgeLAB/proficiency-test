class Student < ActiveRecord::Base

  validates_presence_of [:name, :register_number]
  validates_numericality_of :status, { only_integer: true, greater_than_or_equal_to: 1 }

  has_enumeration_for :status, with: Status, create_helpers: true

end
