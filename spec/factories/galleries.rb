FactoryGirl.define do
  factory :gallery do
    title {Faker::Lorem.words(6).to_s}
  end
end
