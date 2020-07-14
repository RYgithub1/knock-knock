FactoryBot.define do

  factory :user do
    name              {"factoryBot"}
    sequence(:email) { |n| "hiro#{n}@example.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end