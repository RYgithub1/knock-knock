class Nation < ApplicationRecord

  # to Abouts Table
  validates :name, presence: true
  has_many :abouts, through: :about_nations
  has_many :about_nations, dependent: :destroy

end
