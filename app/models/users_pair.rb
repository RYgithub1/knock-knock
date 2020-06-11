class UsersPair < ApplicationRecord

  belongs_to :user
  belongs_to :pair
  validates :user_id, presence: true
  validates :pair_id, presence: true

end
