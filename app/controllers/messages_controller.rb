class MessagesController < ApplicationController

  before_action :login_check_messages, only: [:index]
  before_action :set_pair, only: [:index, :create]
  before_action :onlyTwoPersons_canUsePairDoor_check, only: [:index, :create]


  def index
    @aboutAZ = About.find_by(user_id: UsersPair.where(pair_id: params[:pair_id]).where.not(user_id: current_user.id)[0].user_id)
    @message = Message.new
    @messages = @pair.messages.includes(:user)
  end

  def create
    @message = @pair.messages.new(message_params)
    if @message.save
      # messages#index needs pair_id
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

  def set_pair
    @pair = Pair.find_by(id: params[:pair_id])
  end

  def message_params
    # merge two hashes to register user_id for messages table
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end


             
  def onlyTwoPersons_canUsePairDoor_check
    # binding.pry
    pairIdArray = []
    currentUserPairsArray  = []

    # pairIdArray << params[:pair_id].to_i
    UsersPair.where(pair_id: params[:pair_id]).each do |pi|
      pairIdArray << pi.pair_id
    end

    # current_user.users_pairs.each do |cur|
    #   currentUserPairsArray << cur.pair_id
    # end
    UsersPair.where(user_id: current_user.id).each do |cu|
      currentUserPairsArray << cu.pair_id
    end

    pairIdCheck = pairIdArray & currentUserPairsArray
    if pairIdCheck.blank?
      root_path
    end
  end

end
