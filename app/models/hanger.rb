# == Schema Information
#
# Table name: hangers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  about_id   :integer
#  user_id    :integer
#
class Hanger < ApplicationRecord

  belongs_to :user
  belongs_to :about

end
