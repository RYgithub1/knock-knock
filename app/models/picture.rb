class Picture < ApplicationRecord
  #---- for expression image ----

  mount_uploader :image, ImageUploader

  # to Abouts Table from Picture(expression)
  belongs_to :about
  # 仕様として一端、投稿は任意
  # validates :image, presence: true

end
