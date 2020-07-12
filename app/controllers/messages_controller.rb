class MessagesController < ApplicationController

  before_action :login_check_messages, only: [:index]
  before_action :set_message, only: [:index, :create]
  before_action :onlyTwoPersons_canUsePairDoor_check, only: [:index, :create]


  def index
    @aboutAZ = About.find_by(user_id: UsersPair.where(pair_id: params[:pair_id]).where.not(user_id: current_user.id)[0].user_id)
    @message = Message.new
    @messages = @pair.messages.includes(:user)
    # (kkd)messages#indexを開封 -> 未確認checked:falseの全てが確認済checked:true
    @notifications = current_user.passive_notifications
    @notifications.where(checked: false).each do |notification|
      # 対象ペアのkkdのみ処理
      if notification.pair_id == params[:pair_id].to_i
        notification.update_attributes(checked: true)
      end
    end
  end

  def create
    @message = @pair.messages.new(message_params)
    if @message.save
      # sendAMessage -> callMethod toCreteNewNotification
      @pair.create_notification_message!(current_user, @message.id)
      redirect_to pair_messages_path(@pair)
    else
      @messages = @pair.messages.includes(:user)
      render :index
    end
  end


  private
  def login_check_messages
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_message
    @pair = Pair.find_by(id: params[:pair_id])
  end

  def message_params
    # mergeTwoHashes toRegisterUser_id forMessagesTable
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def onlyTwoPersons_canUsePairDoor_check
    pairIdArray = []
    currentUserPairsArray  = []
    pairIdArray << params[:pair_id].to_i
    current_user.users_pairs.each do |cur|
      currentUserPairsArray << cur.pair_id
    end
    redirect_to root_path if (pairIdArray & currentUserPairsArray).blank?
  end

end
