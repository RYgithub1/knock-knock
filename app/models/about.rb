# == Schema Information
#
# Table name: abouts
#
#  id             :bigint           not null, primary key
#  address        :string(255)
#  birthday       :date             not null
#  body           :text(65535)
#  invitation     :string(255)
#  latitude       :decimal(9, 6)
#  longitude      :decimal(10, 6)
#  nowCity        :string(255)
#  nowCountry     :string(255)
#  recommendation :string(255)
#  sex            :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  nation_id      :integer
#  user_id        :bigint           not null
#
# Indexes
#
#  index_abouts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class About < ApplicationRecord

  # to Users Table and original
  belongs_to :user
  validates :user_id, presence: true
  validates :sex, presence: true

  # to Photos Table
  has_many :photos, dependent: :destroy
  # fields_for -> to show relation for child table name at parent's model
  accepts_nested_attributes_for :photos, allow_destroy: true
  validates_associated :photos
  validates :photos, presence: true

  # to Pictures Table
  has_many :pictures, dependent: :destroy
  # fields_for -> to show relation for child table name at parent's model
  accepts_nested_attributes_for :pictures, allow_destroy: true

  # male/female radio btn by enum
  enum sex: { male: 0, female: 1}

  # association of active_hash for nation.rb
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :nation

  # Tag function at About (object.tag_list.method)
  acts_as_taggable

  # Door Hanger function
  has_many :hangers, dependent: :destroy
  accepts_nested_attributes_for :hangers, allow_destroy: true
  def already_hangered_on?(user)
    hangers.where(user_id: user.id).exists?
  end

  # geocode for map
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
