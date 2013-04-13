FactoryGirl.define do
  factory :project do
      user
      title "The new shoe project"
      teaser "Get new shoes made for you"
      description "I will make new shoes for you, just the way you like it."
      goal 10000
  end

end