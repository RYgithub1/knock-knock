class Photo < ApplicationRecord
  #---- for icon image ----

  mount_uploader :image, ImageUploader

  # to Abouts Table
  belongs_to :about
  # abouts#create登録時に存在しない->バリでかけるとDB登録不可
  # validates :about_id, presence: true
  validates :image, presence: true

end
