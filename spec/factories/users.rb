FactoryBot.define do

  factory :user do
    name                  {"factoryBot"}
    sequence(:email)      { |n| "userMailTest#{n}@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    # ----- fakerでサンプルデータをセットする場合 ----------
    # password = Faker::Internet.password(min_length: 8)
    # name                  {Faker::Name.last_name}
    # email                 {Faker::Internet.free_email}
    # password              {password}
    # password_confirmation {password}
  end

end