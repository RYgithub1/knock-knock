module NotificationsHelper

  # メッセージ未確認(checked: false)の通知有無を確認
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

end
