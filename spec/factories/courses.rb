FactoryGirl.define do
  factory :course do
    sequence(:name) { |n| "Information System #{n}" }
    description "A nice course to lean about Programming and Software Engineering"
    status 1
  end
end
