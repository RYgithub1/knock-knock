# == Schema Information
#
# Table name: users_pairs
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pair_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_users_pairs_on_pair_id  (pair_id)
#  index_users_pairs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (pair_id => pairs.id)
#  fk_rails_...  (user_id => users.id)
#
class UsersPair < ApplicationRecord

  belongs_to :pair, optional: true
  belongs_to :user, optional: true

end
