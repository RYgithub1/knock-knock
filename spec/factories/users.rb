# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
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
