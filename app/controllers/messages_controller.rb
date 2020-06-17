class MessagesController < ApplicationController


  def index
    @pair = Pair.find_by(id: params[:pair_id])
    # @about = About.find_by(id: params[:format])
    @message = Message.new
    @messages = @pair.messages.includes(:user)
    # - binding.pry
  end

              
  def create
    @pair = Pair.find_by(id: params[:pair_id])
    # @about = About.find_by(id: params[:format])
    # binding.pry
    @message = @pair.messages.new(message_params)
    if @message.save
      # messages#index needs pair_id
      redirect_to pair_messages_path(@pair)
    else
      @messages = @pavir.messages.includes(:user)
      render :index
    end
  end
                  

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    # params.require(:message).permit(:content, :image)
  end
end
