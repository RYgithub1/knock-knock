class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_one :about

  # 半角英数字、大小文字、8文字以上
  VALID_NAME_PW_REGEX = /\A^([a-zA-Z0-9]{8,})$\z/i
  validates :name, presence: true, format: { with: VALID_NAME_PW_REGEX }
  # 半角英数字、大小文字、数字、ドットを少なくとも１つ以上繰り返す。＠を挟む
  VALID_EMAIL_REGEX = /\A[a-zA-Z\d.]+@[a-zA-Z\d.]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
            # ,allow_blank: true
  validates :password, presence: true,
            format: { with: VALID_NAME_PW_REGEX }


  has_many :users_pairs, dependent: :destroy
  has_many :pairs, through: :users_pairs
  accepts_nested_attributes_for :users_pairs, allow_destroy: true

  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages, allow_destroy: true


end
