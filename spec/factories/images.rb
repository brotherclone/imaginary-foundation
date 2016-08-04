FactoryGirl.define do
  factory :image do
    file {Faker::Internet.url}
    caption {Faker::Lorem.sentence}
  end
end
