FactoryGirl.define do
  factory :tag do
    topic
    after(:create) do |essay|
      FactoryGirl.create_list(:essay, 3, essay: essay)
    end
    after(:create) do |project|
      FactoryGirl.create_list(:project, 2, project: project)
    end
  end
end
