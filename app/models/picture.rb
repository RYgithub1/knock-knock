# == Schema Information
#
# Table name: pictures
#
#  id         :bigint           not null, primary key
#  image      :string(255)      default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  about_id   :bigint           not null
#
# Indexes
#
#  index_pictures_on_about_id  (about_id)
#
# Foreign Keys
#
#  fk_rails_...  (about_id => abouts.id)
#
class Picture < ApplicationRecord
  #---- for expression image ----

  mount_uploader :image, ImageUploader

  # to Abouts Table from Picture(expression)
  belongs_to :about
  # 仕様として一端、投稿は任意のためコメントアウト
  # validates :image, presence: true

end
