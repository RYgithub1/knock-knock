# == Schema Information
#
# Table name: abouts
#
#  id             :bigint           not null, primary key
#  address        :string(255)
#  birthday       :date             not null
#  body           :text(65535)
#  invitation     :string(255)
#  latitude       :decimal(9, 6)
#  longitude      :decimal(10, 6)
#  nowCity        :string(255)
#  nowCountry     :string(255)
#  recommendation :string(255)
#  sex            :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  nation_id      :integer
#  user_id        :bigint           not null
#
# Indexes
#
#  index_abouts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class AboutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
