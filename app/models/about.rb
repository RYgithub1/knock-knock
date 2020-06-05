class About < ApplicationRecord

  belongs_to :user
  validates :user_id, presence: true,
  validates :category_id, presence: true

  has_many :nations, through: :about_nations
  has_many :about_nations, dependent: :destroy

end
