# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  action     :string(255)      default(""), not null
#  checked    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  message_id :integer
#  pair_id    :integer
#  visited_id :integer          not null
#  visitor_id :integer          not null
#
# Indexes
#
#  index_notifications_on_message_id  (message_id)
#  index_notifications_on_pair_id     (pair_id)
#  index_notifications_on_visited_id  (visited_id)
#  index_notifications_on_visitor_id  (visitor_id)
#
class Notification < ApplicationRecord

  default_scope -> { order(created_at: :desc) }
  belongs_to :pair, optional: true
  belongs_to :message, optional: true

  # optional: true -> hanger通知追加 -> nil格納許可
  belongs_to :visitor, class_name: "User", foreign_key: "visitor_id", optional: true
  belongs_to :visited, class_name: "User", foreign_key: "visited_id", optional: true

end
