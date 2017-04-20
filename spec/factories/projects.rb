FactoryGirl.define do
  factory :project do
    title {Faker::Lorem.words(6).to_s}
    description {Faker::Lorem.words(20).to_s}
    body {Faker::Lorem.paragraphs(5).to_s}
    image {}
    external_url {Faker::Internet.url('imaginary.foundation', '/example')}
  end
end
