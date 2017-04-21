FactoryGirl.define do
  factory :related_link do
    title {Faker::Lorem.words(3).to_s}
    url {Faker::Internet.url('google.com', '/example')}
    project {}
  end
end
