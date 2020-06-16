class Pair < ApplicationRecord

  has_many :users_pairs, dependent: :destroy
  has_many :users, through: :users_pairs
  accepts_nested_attributes_for :users_pairs, allow_destroy: true

  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages, allow_destroy: true

  validates :name, presence: true, uniqueness: true

end
