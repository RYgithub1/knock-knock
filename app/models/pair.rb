class Pair < ApplicationRecord

  has_many :users_pairs, dependent: :destroy
  has_many :users, through: :users_pairs
  accepts_nested_attributes_for :users_pairs, allow_destroy: true

  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages, allow_destroy: true



  # ラストメッセージの表示＠一覧表示
  # def show_last_message
  #   if (last_message = message.last).present?
  #     if last_message.content?
  #       last_message.content
  #     else
  #       "last one is the pucture"
  #     end
  #   else
  #     "no message yet"
  #   end
  # end

end
