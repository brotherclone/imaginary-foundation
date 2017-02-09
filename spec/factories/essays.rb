FactoryGirl.define do
  factory :essay do
    title {Faker::Lorem.words(6)}
    description {Faker::Lorem.words(20)}
    body {Faker::Lorem.paragraphs(5)}
    image {}
    gallery {}
  end
end
