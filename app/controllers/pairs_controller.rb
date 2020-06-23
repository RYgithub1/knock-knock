class PairsController < ApplicationController

  before_action :already_pair_exist_check, only: [:new]
  before_action :login_check_pairs, only: [:index]

           
  def index

    
    # @pair = Pair.find_by(user_id: current_user.id)
    # @pairs = Pair.all(user_id: current_user.id)
    # @pair = Pair.find_by(id: params[:id])
    # @pictures = Picture.where(id: @good.pictures.ids)
    # @pair = Pair.where(user_id: current_user.id)
    # @pairs = Pair.all
    # @pair = Pair.find_by(user_id: current_user.id)
    # @message = Message.new
    # @messages = @pair.messages.includes(:user)
    # @message = Message.find_by(id: @pair.messages.ids)
    # @abouts = About.all
    # @user=User.find(params[:id])
    # @users = User.search(params[:keyword], current_user.id)
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
    # @users = User.all
    # @user = @good.user
    # @grandChild = @good.category
    # @child = @grandChild.parent
    # @parent = @child.parent
    # order(dec/asxx).limit(xxx)
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

  def login_check_pairs
    redirect_to new_user_session_path unless user_signed_in?
  end

end
