FactoryBot.define do
  factory :contact do
    genre_id {1}
    memo     { Faker::Lorem.sentence}
  end
end