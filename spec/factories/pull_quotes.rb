FactoryGirl.define do
  factory :pull_quote do
    quote {Faker::Lorem.words(10).to_s}
    essay {}
  end
end
