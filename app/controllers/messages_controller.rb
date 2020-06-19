class MessagesController < ApplicationController


  def index
    @pair = Pair.find_by(id: params[:pair_id])
    @message = Message.new
    @messages = @pair.messages.includes(:user)
  end

  def create
    @pair = Pair.find_by(id: params[:pair_id])
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
  def message_params
    # merge two hashes to register user_id for messages table
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    # user_id検証
    # params.require(:message).permit(:content, :image).merge(user_id: 6)
  end
end
