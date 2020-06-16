class MessagesController < ApplicationController


  def index
    @message = Message.new
    @pair = Pair.find_by(id: params[:id])
    @messages = @pair.message
    # @messages = @pair.messages.includes(:user)
  end

  def create
  end


  private
  def xxx_params
    # params.require(:message).permit(xxx)
  end



end
