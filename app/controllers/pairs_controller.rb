class PairsController < ApplicationController

  before_action :already_pair_exist_check, only: [:new]

        
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
    @pair = Pair.new
    if @pair.save
      @pair.users = User.where(id: params[:pair][:user_ids])
      redirect_to pair_messages_path(@pair)
    else
      render :new
    end
  end

  def destroy
    @pair.destroy
    redirect_to  pairs_path
  end


  private
  def already_pair_exist_check
    @about = About.find_by(id: params[:format])
    currentArray = []
    ataboutArray = []
    UsersPair.where(user_id: current_user.id).each do |c|
      currentArray << c.pair_id
    end
    UsersPair.where(user_id: @about.user_id).each do |a|
      ataboutArray << a.pair_id
    end
    commonPairId = currentArray & ataboutArray
    if commonPairId.empty?
    else
      @pair = Pair.find_by(id: commonPairId)
      redirect_to pair_messages_path(@pair)
    end
  end

end
