FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Smith"
    email "john@example.com"
    password "1234"
  end
end