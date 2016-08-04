FactoryGirl.define do
  factory :project do
    title {Faker::Lorem.word}
    description {Faker::Lorem.sentence}
    after(:create) do |image|
      FactoryGirl.create_list(:image, 3, imageable: image)
    end
  end
end
