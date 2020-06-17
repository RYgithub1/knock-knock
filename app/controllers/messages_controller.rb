class MessagesController < ApplicationController


      
  def index
    @pair = Pair.find_by(id: params[:pair_id])
    # @about = About.find_by(id: params[:format])

    @message = Message.new
    # @messages = @pair.messages
    # n1発生させて検証、どうやって見分けるか
    # @messages = @pair.messages.includes(:user)
  end


       
  def create
    @pair = Pair.find_by(id: params[:pair_id])
    # @about = About.find_by(id: params[:format])
    # 検証paraｍｓほしいものの見分け方
    # binding.pry
    @message = @pair.messages.new(message_params)
    if @message.save
      # 検証＠pairの必要性
      redirect_to pair_messages_path(@pair)
    else
      # 検証以下の文章の意味、上の書き換えsave前をもってindexへ
      @messages = @pair.messages.includes(:user)
      render :index
    end
  end


  private
  def message_params
    # params.require(:message).permit(:content, :image)
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
