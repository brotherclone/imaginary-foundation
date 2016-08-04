FactoryGirl.define do
  factory :essay do
    title {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    body {Faker::Lorem.paragraph}
    after(:create) do |image|
      FactoryGirl.create_list(:image, 3, imageable: image)
    end
  end
end
