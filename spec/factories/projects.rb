FactoryGirl.define do
  factory :project do
    title {Faker::Lorem.words(6)}
    description {Faker::Lorem.words(20)}
    body {Faker::Lorem.paragraphs(5)}
    image {}
    gallery {}
    external_link {Faker::Internet.url('imaginary.foundation', '/example')}
  end
end
