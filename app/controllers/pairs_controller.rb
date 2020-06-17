class PairsController < ApplicationController


  def index
    # @pair = Pair.find_by(user_id: current_user.id)
    # @pairs = Pair.all(user_id: current_user.id)
    # @pair = Pair.find_by(id: params[:id])
    # @pair = Pair.where(user_id: current_user.id)
    # @pairs = Pair.all
    # @pair = Pair.find_by(user_id: current_user.id)
    # @message = Message.new
    # @messages = @pair.messages.includes(:user)
    # @message = Message.find_by(id: @pair.messages.ids)
    # @abouts = About.all
  end

  def new
    @pair = Pair.new
    @pair.users << current_user
    @about = About.find_by(id: params[:format])
  end

  def create
    @pair = Pair.new(pair_params)
    if @pair.save
      @pair.users = User.where(id: params[:pair][:user_ids])
      redirect_to pair_messages_path(@pair)
    else
      render :new
    end
  end


  def destroy
  end


  private
  def pair_params
    params.require(:pair).permit(:name)
    # 仕様変更時に下記へ修正
    # params.require(:pair).permit(:name, {user_ids:[]}).merge(user_id: current_user.id, about_id: params[:about_id])
  end


end
