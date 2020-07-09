# == Schema Information
#
# Table name: lessons
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  proverb    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
