FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Smith"
      sequence :email do |n|
        "person#{n}@example.com"
      end
    password "1234"
  end
end