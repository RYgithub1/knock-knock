class Photo < ApplicationRecord

  # to Abouts Table
  belongs_to :about
  validates :about_id, presence: true
  validates :image, presence: true

end
