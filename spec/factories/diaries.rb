FactoryBot.define do
  factory :diary do
    content         { Faker::Lorem.sentence }
    place           { Faker::Address.street_name}
    association :user

    after(:build) do |image|
      image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
