class Picture < ApplicationRecord
  #---- for expression image ----

  mount_uploader :image, ImageUploader

  # to Abouts Table
  belongs_to :about
  # 仕様として一端、投稿は任意
  # validates :image, presence: true

end
