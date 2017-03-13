FactoryGirl.define do
  factory :pull_quote do
    quote {Faker::Lorem.words(6)}
    essay {}
  end
end
