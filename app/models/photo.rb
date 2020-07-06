# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  image      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  about_id   :bigint           not null
#
# Indexes
#
#  index_photos_on_about_id  (about_id)
#
# Foreign Keys
#
#  fk_rails_...  (about_id => abouts.id)
#
class Photo < ApplicationRecord
  #---- for icon image ----

  mount_uploader :image, ImageUploader

  # to Abouts Table from Photo(icon)
  belongs_to :about

end
