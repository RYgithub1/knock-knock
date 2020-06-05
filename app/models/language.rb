class Language < ApplicationRecord

  # to Abouts Table
  validates :name, presence: true
  has_many :abouts, through: :about_languages
  has_many :about_languages, dependent: :destroy

end
