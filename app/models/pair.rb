class Pair < ApplicationRecord

  has_many :users_pairs, dependent: :destroy
  has_many :users, through: :users_pairs
  validates :name, presence: true, uniqueness: true

  has_many :messages, dependent: :destroy

end
