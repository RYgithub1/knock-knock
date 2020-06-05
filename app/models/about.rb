class About < ApplicationRecord

  # to Users Table and original
  belongs_to :user
  validates :user_id, presence: true
  validates :sex, presence: true

  # to Nations Table
  has_many :nations, through: :about_nations
  has_many :about_nations, dependent: :destroy

end
