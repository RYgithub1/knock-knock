class Message < ApplicationRecord

  belongs_to :user
  belongs_to :pair
  # belongs_to :user, optional: true
  # belongs_to :pair, optional: true
  validates :user_id, presence: true
  validates :pair_id, presence: true
  validates :content, presence: true

end
