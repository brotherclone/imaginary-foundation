FactoryGirl.define do
  factory :related_link do
    url {Faker::Internet.url('other.com', '/example')}
    title {Faker::Lorem.words(6).to_s}
    project {}
  end
end
