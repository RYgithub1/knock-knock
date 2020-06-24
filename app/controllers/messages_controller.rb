class MessagesController < ApplicationController

  before_action :login_check_messages, only: [:index]
  before_action :set_pair, only: [:index, :create]


  def index
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
    # user_id検証
    # params.require(:message).permit(:content, :image).merge(user_id: 6)
  end

end
