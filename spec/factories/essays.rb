FactoryGirl.define do
  factory :essay do
    title {Faker::Lorem.words(6).to_s}
    description {Faker::Lorem.words(20).to_s}
    body {Faker::Lorem.paragraphs(5).to_s}
    image {}
  end
end
