# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  content    :string(255)
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pair_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_pair_id  (pair_id)
#  index_messages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (pair_id => pairs.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do

  factory :message do
    content {Faker::Lorem.sentence}
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    user
    pair
  end

end
