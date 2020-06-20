class About < ApplicationRecord

  # to Users Table and original
  belongs_to :user
  validates :user_id, presence: true
  validates :sex, presence: true

  # to Photos Table
  has_many :photos, dependent: :destroy
  # fields_for -> to show relation for child table name at parent's model
  accepts_nested_attributes_for :photos, allow_destroy: true

  # to Pictures Table
  has_many :pictures, dependent: :destroy
  # fields_for -> to show relation for child table name at parent's model
  accepts_nested_attributes_for :pictures, allow_destroy: true

  #  add male/female radio btn by enum
  enum sex: { male: 0, female: 1}

  # association of active_hash for nation.rb
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :nation

  # add Tag function at About (object.tag_list.method)
  acts_as_taggable

  has_many :hangers


  # -------------------------
  # geocoded_by :address
  # after_validation :geocode

end
