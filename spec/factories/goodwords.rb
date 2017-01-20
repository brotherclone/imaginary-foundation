FactoryGirl.define do
  factory :goodword do
    word {Faker::Lorem.word}
    good {true}
    fromURL {Faker::Internet.url('imaginary.foundation', '/example')}
    trait :bad do
      good {false}
    end
  end
end