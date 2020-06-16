class Message < ApplicationRecord

  belongs_to :pair
  belongs_to :user

  # validates :user_id, presence: true
  # validates :pair_id, presence: true

  validates :content, presence: true, unless: :image?


end
