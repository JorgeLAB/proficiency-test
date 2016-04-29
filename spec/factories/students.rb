FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "Stundent Test #{n}" }
    sequence(:register_number) { |n| "83029483290#{n}" }
    status 1
  end
end
