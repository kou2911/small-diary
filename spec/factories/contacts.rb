FactoryBot.define do
  factory :contact do
    genre_id {2}
    memo     { Faker::Lorem.sentence}
  end
end