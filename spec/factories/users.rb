FactoryBot.define do
  factory :user do
    name { Faker::TvShows::StrangerThings.character }
    email { Faker::Internet.email }
  end
end
