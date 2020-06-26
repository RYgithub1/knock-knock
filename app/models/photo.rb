class Photo < ApplicationRecord
  #---- for icon image ----

  mount_uploader :image, ImageUploader

  # to Abouts Table from Photo(icon)
  belongs_to :about

end
