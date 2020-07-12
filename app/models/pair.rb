# == Schema Information
#
# Table name: pairs
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pair < ApplicationRecord

  has_many :users_pairs, dependent: :destroy
  has_many :users, through: :users_pairs
  accepts_nested_attributes_for :users_pairs, allow_destroy: true

  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages, allow_destroy: true

  has_many :notifications, dependent: :destroy


  # ----- notification -----------------------------
  def create_notification_message!(current_user, message_id)
    # メッセージをした全ての人(自分以外)のuser_id取得 -> 重複なし -> 全員に通知
    temp_ids = Message.select(:user_id).where(pair_id: id).where.not(user_id: current_user.id).distinct
    # [1]自分宛てのメッセージが有り場合
    temp_ids.each do |temp_id|
      save_notification_message!(current_user, message_id, temp_id["user_id"])
    end
    # [2]自分宛てのメッセージが無し（メッセージ送付した一発目の）場合
    save_notification_message!(current_user, message_id, user_ids) if temp_ids.blank?
  end

  def save_notification_message!(current_user, message_id, visited_id)
    # 同一ペアで複数回メッセージ有りの場合 -> そのペア向けに、複数回分の呼び出し内容をDBへ保存
    notification = current_user.active_notifications.new(
      pair_id: id,
      message_id: message_id,
      visited_id: UsersPair.where(pair_id: id).where.not(user_id: current_user.id)[0].user_id,
      action: "message"
    )
    # 自分からメッセージを送った場合 -> 通知済みtrue(新規通知なし)
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

end
