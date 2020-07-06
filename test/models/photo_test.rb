# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  image      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  about_id   :bigint           not null
#
# Indexes
#
#  index_photos_on_about_id  (about_id)
#
# Foreign Keys
#
#  fk_rails_...  (about_id => abouts.id)
#
require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
