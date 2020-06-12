class MessagesController < ApplicationController


  def index
    @message = Message.new
    @pair = Pair.find_by(id: params[:id])
    @messages = @pair.message
    # @messages = @pair.message.includes(:user)
    # @messages = @pair.messages.includes(:user)

  end
  def show
  end


end
