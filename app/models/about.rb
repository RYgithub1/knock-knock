class About < ApplicationRecord

  # to Users Table and original
  belongs_to :user
  validates :user_id, presence: true
  validates :sex, presence: true

  # to Photos Table
  has_many :photos, dependent: :destroy
  # accepts_nested_attributes_for :pictures, allow_destroy: true

  # to Nations Table
  has_many :nations, through: :about_nations
  has_many :about_nations, dependent: :destroy

  # to Languages Table
  has_many :languages, through: :about_languages
  has_many :about_languages, dependent: :destroy

end
