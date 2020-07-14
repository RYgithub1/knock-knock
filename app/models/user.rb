# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  # １user１profile
  has_one :about

  # 半角英数字、大小文字、8文字以上
  VALID_NAME_PW_REGEX = /\A^([a-zA-Z0-9]{8,})$\z/i
  validates :name, presence: true, format: { with: VALID_NAME_PW_REGEX }, length: { maximum: 8 }
  # 「半角英数字で大小文字か数字かドット」を少なくとも１つ以上繰り返す。＠を挟む
  VALID_EMAIL_REGEX = /\A[a-zA-Z\d.]+@[a-zA-Z\d.]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true,
            format: { with: VALID_NAME_PW_REGEX }


  has_many :users_pairs, dependent: :destroy
  has_many :pairs, through: :users_pairs
  accepts_nested_attributes_for :users_pairs, allow_destroy: true

  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages, allow_destroy: true

  has_many :hangers, dependent: :destroy
  accepts_nested_attributes_for :hangers, allow_destroy: true

  # (from me)active_notifications,(from other)passive_notifications
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

end
