# == Schema Information
#
# Table name: contacts
#
#  id         :bigint           not null, primary key
#  cmail      :string(255)      default(""), not null
#  content    :text(65535)      not null
#  name       :string(255)      not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
