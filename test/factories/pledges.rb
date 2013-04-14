FactoryGirl.define do
  factory :pledge do
    amount 50
    user
    project
  end
end