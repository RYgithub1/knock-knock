class Picture < ApplicationRecord
  #---- for expression image ----

  mount_uploader :image, ImageUploader

  # to Abouts Table
  belongs_to :about
  validates :image, presence: true

end
