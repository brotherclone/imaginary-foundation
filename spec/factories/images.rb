FactoryGirl.define do
  factory :image do
    image_file {'image.png'}
    title {Faker::Lorem.words(3).to_s}
    caption {Faker::Lorem.words(12).to_s}
    credit {Faker::Name.name}
    credit_link {Faker::Internet.url('imaginary.foundation', '/example')}
  end
end
