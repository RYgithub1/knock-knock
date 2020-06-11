class Pair < ApplicationRecord

  has_many :users_pairs, dependent: :destroy
  has_many :users,       through: :users_pairs
  has_many :messages     dependent: :destroy
  validates :name, presence: true, uniqueness: true

end
